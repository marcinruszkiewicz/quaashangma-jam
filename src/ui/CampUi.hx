package ui;

class CampUi extends UiElement {
  public var description:h2d.Text;
  public var hp:h2d.Text;
  public var gold:h2d.Text;
  public var title:h2d.Text;
  var layout:h2d.Layers;
  var entranceflow:h2d.Flow;

  public function new(root:h2d.Layers, layer:Int) {
    super(root, layer);

    layout = new h2d.Layers(App.instance.s2d);
    layout.y = 100;

    var statsbg = Assets.graphics.toScaleGrid("lightwin", 0);
    statsbg.width = 700;
    statsbg.height = 100;
    statsbg.x = Const.W / 2 - 350;
    statsbg.y = 15;
    layout.add(statsbg, 0);

    var header = Assets.graphics.toScaleGrid("header", 0);
    header.width = 350;
    header.height = 80;
    header.x = Const.W / 2 - 175;
    header.y = 0;
    layout.add(header, 2);

    var skull = new h2d.Bitmap(Assets.graphics.getSlice("skull").tile, header);
    skull.x = 175 - 68;
    skull.y = -30;

    var descriptionbg = Assets.graphics.toScaleGrid("lightwin", 0);
    descriptionbg.width = 768;
    descriptionbg.height = 350;
    descriptionbg.y = 60;
    layout.add(descriptionbg, 1);

    entranceflow = new h2d.Flow(App.instance.s2d);
    entranceflow.layout = Horizontal;
    entranceflow.y = 350;
    entranceflow.x = 14;
    entranceflow.horizontalSpacing = 10;
    layout.add(entranceflow, 2);

    for (i in [1, 25, 50]) {
      addEntrance(i);
    }

    title = new h2d.Text(Assets.font32, header);
    title.x = 175;
    title.y = 22;
    title.textColor = Const.textColor;
    title.textAlign = Center;
    title.text = 'Camp';

    hp = new h2d.Text(Assets.font24, statsbg);
    hp.x = 20;
    hp.y = 20;
    hp.textColor = Const.textColor;

    gold = new h2d.Text(Assets.font24, statsbg);
    gold.x = 530;
    gold.y = 20;
    gold.textColor = Const.textColor;

    description = new h2d.Text(Assets.font24, descriptionbg);
    description.x = 20;
    description.y = 30;
    description.textColor = Const.textColor;
    description.maxWidth = 730;

    var camp_description = Const.CampText;

    if (App.gold > 15) {
      var pots = Std.int(App.gold / 15);

      App.maxHP += pots * 5;
      App.gold -= pots * 15;

      camp_description += '\nYou sell the treasures and buy Stamina Potions, increasing your max HP by ${pots * 5}.';
    } else {
      camp_description += "\nYou see a Stamina Potion vendor that sells one potion for 15 gold. Not a bad price for 5 more max HP.";
    }

    description.text = camp_description;
    App.HP = App.maxHP;
    hp.text = 'HP: ${App.HP}/${App.maxHP}';
    gold.text = 'Gold: ${App.gold}';
  }

  function addEntrance(floor:Int) {
    var entrancebg = Assets.graphics.toScaleGrid("darkwin", 0, entranceflow);
    entrancebg.width = 240;
    entrancebg.height = 310;

    var header = Assets.graphics.toScaleGrid("header", 0, entrancebg);
    header.width = 240;
    header.height = 80;
    header.x = 0;
    header.y = 0;

    var entranceimg = new h2d.Bitmap(hxd.Res.entrance.toTile(), entrancebg);
    entranceimg.x = 5;
    entranceimg.y = 75;

    var title = new h2d.Text(Assets.font32, header);
    title.text = 'Floor $floor';
    title.textColor = Const.textColor;
    title.textAlign = Center;
    title.x = 120;
    title.y = 22;

    if (App.maxVisitedFloor >= floor) {
      var button = new h2d.Interactive(230, 230, entranceimg);
      button.onOver = function(_) {
        if (App.playSound) {
          hxd.Res.sound.click1.play();
        }
        entranceimg.color = h3d.Vector.fromArray([0.9, 0.9, 0, 0.2]);
        entranceimg.blendMode = Screen;
      };
      button.onOut = function(_) {
        entranceimg.color = h3d.Vector.fromArray([1, 1, 1, 1]);
        entranceimg.blendMode = Alpha;
      }
      button.onClick = function(_) {
        if (App.playSound) {
          hxd.Res.sound.click1.play();
        }
        App.currentFloor = 1;
        App.currentRooms = 0;
        App.instance = new game.Game();
      }
    } else {
      var unavailableC = new h2d.Text(Assets.font32, entranceimg);
      unavailableC.x = 115;
      unavailableC.y = 80;
      unavailableC.textColor = 0xFFFFFF;
      unavailableC.textAlign = Center;
      unavailableC.text = 'Unavailable\n${App.maxVisitedFloor}/50';
    }
  }
}
