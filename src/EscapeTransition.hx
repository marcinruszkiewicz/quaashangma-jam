import Const;

class EscapeTransition extends Scene {
  var bg:h2d.Object;
  var font:h2d.Font;
  var description:h2d.Text;
  var floorUI:h2d.Text;
  var backtext:h2d.Text;
  var backbutton:h2d.Bitmap;

  override function init() {
    s2d.scaleMode = Stretch(Const.W, Const.H);
    s2d.removeChildren();

    bg = new h2d.Object(s2d);
    for (x in 0...3) {
      for (y in 0...3) {
        var bgtile = new h2d.Bitmap(hxd.Res.stonetile.toTile(), bg);
        bgtile.x = 256 * x;
        bgtile.y = 256 * y;
      }
    }

    var b1 = new h2d.Bitmap(hxd.Res.floortransition.toTile(), bg);
    font = hxd.Res.fonts.alagard.toFont();

    floorUI = new h2d.Text(font, s2d);
    floorUI.x = Const.floorTransitionUIPosition[0];
    floorUI.y = Const.floorTransitionUIPosition[1];
    floorUI.textColor = Const.textColor;
    floorUI.textAlign = Center;
    floorUI.text = 'Floor ${Main.currentFloor}';

    description = new h2d.Text(font, s2d);
    description.text = Const.EscapeText;
    description.x = Const.descriptionTransitionPosition[0];
    description.y = Const.descriptionTransitionPosition[1];
    description.textColor = Const.textColor;
    description.maxWidth = 730;

    var buttontiles = hxd.Res.buttons.toTile();

    backbutton = new h2d.Bitmap(buttontiles.sub(0, 0, 300, 64), s2d);
    backbutton.setPosition(234, 432);

    backtext = new h2d.Text(font, backbutton);
    backtext.text = "Wake up in Camp";
    backtext.x = 150;
    backtext.y = 16;
    backtext.textColor = Const.textColor;
    backtext.textAlign = Center;

    var i = new h2d.Interactive(300, 64, backbutton);
    i.onClick = function(_) {
      Main.currentFloor = 1;
      Main.currentRooms = 0;
      Main.gold = 0;
      Main.instance = new Title();
    };
    i.onOver = function(_) {
      backtext.textColor = Const.hoverColor;
    };
    i.onOut = function(_) {
      backtext.textColor = Const.textColor;
    };
  }

  static function main() {
    new EscapeTransition();
  }
}
