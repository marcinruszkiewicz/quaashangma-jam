package game;

class Game extends Scene {
  public var game_ui:ui.GameUi;
  public var rooms:Array<ui.Room> = [];
  public var forward_button:ui.Forward;

  override function init() {
    super.init();

    initDungeon();

    new ui.GameBackground(root, Const.DP_BG);
    new ui.SoundControls(root, Const.DP_UI);

    game_ui = new ui.GameUi(root, Const.DP_UI);

    initUI();
    initRooms();
  }

  static function main() {
    new game.Game();
  }

  function initDungeon() {
    App.floorplan = new game.DungeonFloor(App.currentFloor);
  }

  function initUI() {
    game_ui.description.text = Const.DefaultText;
    game_ui.title.text = 'Floor ${App.currentFloor}';
    game_ui.hp.text = 'HP: ${App.HP}/${App.maxHP}';
    game_ui.gold.text = 'Gold: ${App.gold}';
  }

  function initRooms() {
    var room_set = App.floorplan.rooms[App.currentRooms];
    var set_exit = App.floorplan.exit_path[App.currentRooms];
    var rooms_to_ui = [game_ui.roomtop, game_ui.roomleft, game_ui.roombottom, game_ui.roomright];
    game_ui.description.text = Const.DefaultText;

    if (game_ui.forward_button != null) {
      game_ui.forward_button.remove();
    }

    for(r in rooms_to_ui) {
      r.removeChildren();
    }

    for (i => room in room_set) {
      var room_ui = switch(room) {
        case 1:
          new ui.Room(root, 3, rooms_to_ui[i], 'monster');
        case 2:
          new ui.Room(root, 3, rooms_to_ui[i], 'trap');
        case 3:
          new ui.Room(root, 3, rooms_to_ui[i], 'treasure');
        case 4:
          new ui.Room(root, 3, rooms_to_ui[i], 'exit');
        case _:
          new ui.Room(root, 3, rooms_to_ui[i], 'empty');
      }
      rooms[i] = room_ui;

      room_ui.button.onClick = function(_) {
        if (App.playSound) {
          hxd.Res.sound.click1.play();
        }
        visitRoom(i);
      }
    }
  }

  function visitRoom(i:Int) {
    var room_description = "";
    if (game_ui.forward_button != null) {
      game_ui.forward_button.remove();
    }

    if (App.floorplan.is_visited(App.currentRooms, i)) {
      room_description += "There's nothing here anymore.";
    } else {
      App.floorplan.visited[App.currentRooms][i] = 1;

      rooms[i].showVisited();

      room_description += rooms[i].description;

      switch (App.floorplan.rooms[App.currentRooms][i]) {
        case 1:
          // monster room
          var hp = Std.random(App.currentFloor) + Std.random(5);
          App.HP -= hp;
          game_ui.hp.text = 'HP: ${App.HP}/${App.maxHP}';

          if (App.HP <= 0) {
            App.instance = new game.EscapeTransition();
          } else {
            room_description += '\nYou manage to defeat the monsters.';
          }

          var drop = Std.random(31);
          if (drop <= 10) {
            room_description += '\nOne of the monsters drops a healing potion.';
            if (App.HP + 5 >= App.maxHP) {
              App.HP = App.maxHP;
            } else {
              App.HP += 5;
            }
            game_ui.hp.text = 'HP: ${App.HP}/${App.maxHP}';
          }
        case 2:
          // trap room
          var rand = Std.random(2);
          var hp = Std.random(App.currentFloor) + Std.random(4);

          switch(rand) {
            case 0:
              room_description += "\nYou manage to avoid the trap.";
            case _:
              App.HP -= hp;
              game_ui.hp.text = 'HP: ${App.HP}/${App.maxHP}';
              if (App.HP <= 0) {
                App.instance = new game.EscapeTransition();
              } else {
                if (hp == 0) {
                  room_description += "\nYou easily avoid the trap.";
                } else {
                  room_description += '\nThe trap has taken $hp HP from you.';
                }
              }
          }
        case 3:
          // treasure!
          var gold = Std.random(App.currentFloor) + Std.random(4);
          App.gold += gold;
          game_ui.gold.text = 'Gold: ${App.gold}';

          switch(gold) {
            case 0:
              room_description += "\nSadly nothing in this room has any value.";
            case _:
              room_description += '\nYou find ${gold} gold worth of treasure.';
          };
      }
    }

    if (i == App.floorplan.exit_path[App.currentRooms]) {
      room_description += '\nYou can explore further from here.';

      rooms[i].showExit();

      game_ui.forward_button = new ui.Forward(root, 3, game_ui.statsleft);
      game_ui.forward_button.button.onClick = function(_) {
        if (App.playSound) {
          hxd.Res.sound.click1.play();
        }
        if (App.floorplan.rooms[App.currentRooms][i] == 4) {
          // load next floor
          App.instance = new game.FloorTransition();
        } else {
          // load next level set.
          App.currentRooms++;
          initRooms();
        }
      };
    }

    game_ui.description.text = room_description;
  }
}
