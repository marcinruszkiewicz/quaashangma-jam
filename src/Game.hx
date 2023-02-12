import Const;

class Game extends Scene {
  var bg:h2d.Object;
  var roomObj:h2d.Object;
  var font:h2d.Font;
  var rooms:Array<h2d.Bitmap> = [];
  var roombuttons:Array<h2d.Interactive> = [];
  var description:h2d.Text;
  var floorUI:h2d.Text;
  var hpUI:h2d.Text;
  var goldUI:h2d.Text;
  var forwardtext:h2d.Text;
  var forwardbutton:h2d.Bitmap;

  override function init() {
    s2d.scaleMode = Stretch(Const.W, Const.H);

    bg = new h2d.Object(s2d);
    for (x in 0...3) {
      for (y in 0...3) {
        var bgtile = new h2d.Bitmap(hxd.Res.stonetile.toTile(), bg);
        bgtile.x = 256 * x;
        bgtile.y = 256 * y;
      }
    }
    roomObj = new h2d.Object(s2d);

    var b1 = new h2d.Bitmap(hxd.Res.ui1a.toTile(), bg);
    font = hxd.Res.fonts.alagard.toFont();

    floorUI = new h2d.Text(font, s2d);
    floorUI.x = Const.floorUIPosition[0];
    floorUI.y = Const.floorUIPosition[1];
    floorUI.textColor = Const.textColor;
    floorUI.textAlign = Center;

    description = new h2d.Text(font, s2d);
    description.text = Const.DefaultText;
    description.x = Const.descriptionPosition[0];
    description.y = Const.descriptionPosition[1];
    description.textColor = Const.textColor;
    description.maxWidth = 730;

    hpUI = new h2d.Text(font, s2d);
    hpUI.x = Const.hpUIPosition[0];
    hpUI.y = Const.hpUIPosition[1];
    hpUI.textColor = Const.textColor;

    goldUI = new h2d.Text(font, s2d);
    goldUI.x = Const.goldUIPosition[0];
    goldUI.y = Const.goldUIPosition[1];
    goldUI.textColor = Const.textColor;

    Main.drawSoundControls(s2d);
    initDungeon();
  }

  function initDungeon() {
    Main.floorplan = new DungeonFloor(Main.currentFloor);
    // trace(Main.floorplan);

    initUI();
    initRooms();
  }

  function initRooms() {
    var room_set = Main.floorplan.rooms[Main.currentRooms];
    var set_exit = Main.floorplan.exit_path[Main.currentRooms];

    for (button in roombuttons) {
      button.remove();
    }
    forwardbutton.remove();
    roomObj.removeChildren();
    description.text = Const.DefaultText;

    for (i => room in room_set) {
      var graphics_rand = Std.random(2);

      switch (room) {
        case 0:
          // empty room
          rooms[i] = new h2d.Bitmap(hxd.Res.loader.load('rooms/empty/$graphics_rand.png').toTile(), roomObj);
        case 1:
          // monster room
          rooms[i] = new h2d.Bitmap(hxd.Res.loader.load('rooms/monster/$graphics_rand.png').toTile(), roomObj);
        case 2:
          // trap room
          rooms[i] = new h2d.Bitmap(hxd.Res.loader.load('rooms/trap/$graphics_rand.png').toTile(), roomObj);
        case 3:
          // treasure!
          rooms[i] = new h2d.Bitmap(hxd.Res.loader.load('rooms/treasure/$graphics_rand.png').toTile(), roomObj);
        case 4:
          // dungeon exit
          rooms[i] = new h2d.Bitmap(hxd.Res.loader.load('rooms/exit/$graphics_rand.png').toTile(), roomObj);
      }

      rooms[i].setPosition(Const.RoomPositions[i][0], Const.RoomPositions[i][1]);
      roombuttons[i] = new h2d.Interactive(Const.RoomButtonSize[0], Const.RoomButtonSize[1], rooms[i]);

      roombuttons[i].onOver = function(_) {
        if (Main.playSound) {
          hxd.Res.sound.click1.play();
        }
        hover(i);
      };

      roombuttons[i].onOut = function(_) {
        clearHover(i);
      }

      roombuttons[i].onClick = function(_) {
        if (Main.playSound) {
          hxd.Res.sound.click1.play();
        }
        visitRoom(i);
      }
    }
  }

  function hover(i:Int) {
    var g = new h2d.filter.Glow(0xFFFFFF, 100, 5);
    rooms[i].filter = g;
  }

  function clearHover(i:Int) {
    rooms[i].filter = null;
  }

  function visitRoom(i:Int) {
    var room_description = "";
    forwardbutton.remove();

    if (Main.floorplan.is_visited(Main.currentRooms, i)) {
      room_description += "There's nothing here anymore.";
    } else {
      Main.floorplan.visited[Main.currentRooms][i] = 1;

      var visitedIcon = new h2d.Bitmap(hxd.Res.checkmark.toTile(), rooms[i]);
      visitedIcon.setPosition(2, 180);

      switch (Main.floorplan.rooms[Main.currentRooms][i]) {
        case 0:
          // empty room
          room_description += Const.EmptyRoomText[Std.random(Const.EmptyRoomText.length)];
        case 1:
          // monster room
          room_description += Const.MonsterRoomText[Std.random(Const.MonsterRoomText.length)];
          var hp = Std.random(Main.currentFloor) + Std.random(5);
          Main.HP -= hp;
          hpUI.text = 'HP: ${Main.HP}/${Main.maxHP}';

          if (Main.HP <= 0) {
            Main.instance = new EscapeTransition();
          } else {
            room_description += '\nYou manage to defeat the monsters.';
          }

          var drop = Std.random(31);
          if (drop <= 10) {
            room_description += '\nOne of the monsters drops a healing potion.';
            if (Main.HP + 5 >= Main.maxHP) {
              Main.HP = Main.maxHP;
            } else {
              Main.HP += 5;
            }
          }
        case 2:
          room_description += Const.TrapRoomText[Std.random(Const.TrapRoomText.length)];

          // trap room
          var rand = Std.random(2);
          var hp = Std.random(Main.currentFloor) + Std.random(4);

          switch(rand) {
            case 0:
              room_description += "\nYou manage to avoid the trap.";
            case _:
              Main.HP -= hp;
              hpUI.text = 'HP: ${Main.HP}/${Main.maxHP}';
              if (Main.HP <= 0) {
                Main.instance = new EscapeTransition();
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
          room_description += Const.TreasureRoomText[Std.random(Const.TreasureRoomText.length)];

          var gold = Std.random(Main.currentFloor) + Std.random(4);
          Main.gold += gold;
          goldUI.text = 'Gold: ${Main.gold}';

          switch(gold) {
            case 0:
              room_description += "\nSadly nothing in this room has any value.";
            case _:
              room_description += '\nYou find ${gold} gold worth of treasure.';
          };
        case 4:
          // dungeon exit
          room_description += Const.ExitRoomText[Std.random(Const.ExitRoomText.length)];
      }
    }

    if (i == Main.floorplan.exit_path[Main.currentRooms]) {
      room_description += '\nYou can explore further from here.';
      var exitIcon = new h2d.Bitmap(hxd.Res.exit.toTile(), rooms[i]);
      exitIcon.setPosition(184, 180);
      showForwardButton(i);
    }

    description.text = room_description;
  }

  function showForwardButton(i:Int) {
    var buttontiles = hxd.Res.midbuttons.toTile();
    forwardbutton = new h2d.Bitmap(buttontiles.sub(0, 64, 160, 64), s2d);
    forwardbutton.setPosition(558, 256);

    forwardtext = new h2d.Text(font, forwardbutton);
    forwardtext.text = "Explore";
    forwardtext.x = 80;
    forwardtext.y = 16;
    forwardtext.textColor = Const.textColor;
    forwardtext.textAlign = Center;

    var i2 = new h2d.Interactive(160, 64, forwardbutton);
    i2.onClick = function(_) {
      if (Main.playSound) {
        hxd.Res.sound.click1.play();
      }
      if (Main.floorplan.rooms[Main.currentRooms][i] == 4) {
        // load next floor
        Main.instance = new FloorTransition();
      } else {
        // load next level set.
        Main.currentRooms++;
        initRooms();
      }
    };
    i2.onOver = function(_) {
      if (Main.playSound) {
        hxd.Res.sound.click1.play();
      }
      forwardtext.textColor = Const.hoverColor;
    };
    i2.onOut = function(_) {
      forwardtext.textColor = Const.textColor;
    };
  }

  function initUI() {
    description.text = Const.DefaultText;
    floorUI.text = 'Floor ${Main.currentFloor}';
    hpUI.text = 'HP: ${Main.HP}/${Main.maxHP}';
    goldUI.text = 'Gold: ${Main.gold}';
  }

  static function main() {
    new Game();
  }
}
