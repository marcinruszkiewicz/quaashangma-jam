import Const;

class Camp extends Scene {
  var bg:h2d.Object;
  var font:h2d.Font;
  var description:h2d.Text;
  var floorUI:h2d.Text;
  var hpUI:h2d.Text;
  var goldUI:h2d.Text;

  override function init() {
    s2d.scaleMode = Stretch(Const.W, Const.H);
    s2d.removeChildren();

    bg = new h2d.Object(s2d);
    var b0 = new h2d.Bitmap(hxd.Res.titlebg0.toTile(), bg);
    var b1 = new h2d.Bitmap(hxd.Res.camp.toTile(), bg);
    font = hxd.Res.fonts.alagard.toFont();

    floorUI = new h2d.Text(font, s2d);
    floorUI.x = Const.campUIPosition[0];
    floorUI.y = Const.campUIPosition[1];
    floorUI.textColor = Const.textColor;
    floorUI.textAlign = Center;
    floorUI.text = 'Camp';

    hpUI = new h2d.Text(font, s2d);
    hpUI.x = Const.campHpUIPosition[0];
    hpUI.y = Const.campHpUIPosition[1];
    hpUI.textColor = Const.textColor;

    goldUI = new h2d.Text(font, s2d);
    goldUI.x = Const.campGoldUIPosition[0];
    goldUI.y = Const.campGoldUIPosition[1];
    goldUI.textColor = Const.textColor;

    description = new h2d.Text(font, s2d);
    description.x = Const.descriptionCampPosition[0];
    description.y = Const.descriptionCampPosition[1];
    description.textColor = Const.textColor;
    description.maxWidth = 730;

    var camp_description = "You rest in the Adventurer Guild Camp, restoring all your HP.\n";

    if (Main.gold > 15) {
      var pots = Std.int(Main.gold / 15);

      Main.maxHP += pots * 5;
      Main.gold -= pots * 15;

      camp_description += '\nYou sell the treasures and buy $pots Stamina Potions, increasing your max HP by ${pots * 5}.';
    } else {
      camp_description += "\nYou see a Stamina Potion vendor that sells one potion for 15 gold. Not a bad price for 5 more max HP.";
    }

    description.text = camp_description;
    Main.HP = Main.maxHP;
    hpUI.text = 'HP: ${Main.HP}/${Main.maxHP}';
    goldUI.text = 'Gold: ${Main.gold}';

    var entranceAtext = new h2d.Text(font, s2d);
    entranceAtext.x = Const.entranceAPosition[0];
    entranceAtext.y = Const.entranceAPosition[1];
    entranceAtext.textColor = Const.textColor;
    entranceAtext.textAlign = Center;
    entranceAtext.text = 'Floor 1';

    var entranceAimg = new h2d.Bitmap(hxd.Res.entrance.toTile(), s2d);
    entranceAimg.setPosition(Const.entranceAImagePosition[0], Const.entranceAImagePosition[1]);

    if (Main.maxVisitedFloor >= 1) {
      var entranceAbutton = new h2d.Interactive(236, 246, entranceAimg);
      entranceAbutton.onOver = function(_) {
        var g = new h2d.filter.Glow(0xFFFFFF, 100, 5);
        entranceAimg.filter = g;
      };
      entranceAbutton.onOut = function(_) {
        entranceAimg.filter = null;
      }
      entranceAbutton.onClick = function(_) {
        Main.currentFloor = 1;
        Main.currentRooms = 0;
        Main.instance = new Game();
      }
    } else {
      var unavailableA = new h2d.Text(font, entranceAimg);
      unavailableA.x = 118;
      unavailableA.y = 107;
      unavailableA.textColor = 0xFFFFFF;
      unavailableA.textAlign = Center;
      unavailableA.text = 'Unavailable';
    }

    var entranceBtext = new h2d.Text(font, s2d);
    entranceBtext.x = Const.entranceBPosition[0];
    entranceBtext.y = Const.entranceBPosition[1];
    entranceBtext.textColor = Const.textColor;
    entranceBtext.textAlign = Center;
    entranceBtext.text = 'Floor 25';

    var entranceBimg = new h2d.Bitmap(hxd.Res.entrance.toTile(), s2d);
    entranceBimg.setPosition(Const.entranceBImagePosition[0], Const.entranceBImagePosition[1]);

    if (Main.maxVisitedFloor >= 25) {
      var entranceBbutton = new h2d.Interactive(236, 246, entranceBimg);
      entranceBbutton.onOver = function(_) {
        var g = new h2d.filter.Glow(0xFFFFFF, 100, 5);
        entranceBimg.filter = g;
      };
      entranceBbutton.onOut = function(_) {
        entranceBimg.filter = null;
      }
      entranceBbutton.onClick = function(_) {
        Main.currentFloor = 1;
        Main.currentRooms = 0;
        Main.instance = new Game();
      }
    } else {
      var unavailableB = new h2d.Text(font, entranceBimg);
      unavailableB.x = 118;
      unavailableB.y = 107;
      unavailableB.textColor = 0xFFFFFF;
      unavailableB.textAlign = Center;
      unavailableB.text = 'Unavailable';
    }

    var entranceCtext = new h2d.Text(font, s2d);
    entranceCtext.x = Const.entranceCPosition[0];
    entranceCtext.y = Const.entranceCPosition[1];
    entranceCtext.textColor = Const.textColor;
    entranceCtext.textAlign = Center;
    entranceCtext.text = 'Floor 50';

    var entranceCimg = new h2d.Bitmap(hxd.Res.entrance.toTile(), s2d);
    entranceCimg.setPosition(Const.entranceCImagePosition[0], Const.entranceCImagePosition[1]);

    if (Main.maxVisitedFloor >= 50) {
      var entranceCbutton = new h2d.Interactive(236, 246, entranceCimg);
      entranceCbutton.onOver = function(_) {
        var g = new h2d.filter.Glow(0xFFFFFF, 100, 5);
        entranceCimg.filter = g;
      };
      entranceCbutton.onOut = function(_) {
        entranceCimg.filter = null;
      }
      entranceCbutton.onClick = function(_) {
        Main.currentFloor = 1;
        Main.currentRooms = 0;
        Main.instance = new Game();
      }
    } else {
      var unavailableC = new h2d.Text(font, entranceCimg);
      unavailableC.x = 118;
      unavailableC.y = 107;
      unavailableC.textColor = 0xFFFFFF;
      unavailableC.textAlign = Center;
      unavailableC.text = 'Unavailable';
    }
  }

  static function main() {
    new Camp();
  }
}
