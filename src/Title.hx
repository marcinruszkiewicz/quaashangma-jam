import Const;

class Title extends Scene {
  var bg:h2d.Object;
  var title:h2d.Text;
  var start:h2d.Text;
  var cloud_layer:h2d.Bitmap;
  var cloud_layer2:h2d.Bitmap;

  override function init() {
    Main.loadSettings();

    s2d.scaleMode = Stretch(Const.W, Const.H);
    bg = new h2d.Object(s2d);
    cloud_layer = new h2d.Bitmap(hxd.Res.clouds.toTile(), bg);
    cloud_layer2 = new h2d.Bitmap(hxd.Res.clouds.toTile(), bg);
    cloud_layer2.x = 1600;
    var castle_layer = new h2d.Bitmap(hxd.Res.castle.toTile(), bg);

    var font = hxd.Res.fonts.alagard.toFont();
    var titlebg = new h2d.Bitmap(hxd.Res.titleui.toTile(), bg);
    titlebg.setPosition(234, 400);

    title = new h2d.Text(font, titlebg);
    title.text = "Quaashangma";
    title.x = 150;
    title.y = 46;
    title.textColor = Const.textColor;
    title.textAlign = Center;

    var buttontiles = hxd.Res.midbuttons.toTile();
    var forwardbutton = new h2d.Bitmap(buttontiles.sub(0, 64, 160, 64), titlebg);
    forwardbutton.setPosition(70, 102);

    var forwardtext = new h2d.Text(font, forwardbutton);
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
      Main.instance = new Camp();
    };
    i2.onOver = function(_) {
      forwardtext.textColor = Const.hoverColor;
      if (Main.playSound) {
        hxd.Res.sound.click1.play();
      }
    };
    i2.onOut = function(_) {
      forwardtext.textColor = Const.textColor;
    };

    var cfont = hxd.Res.fonts.alagard16.toFont();
    var copytext = new h2d.Text(cfont, s2d);
    copytext.x = 16;
    copytext.y = 700;
    copytext.textColor = 0xFFFFFF;
    copytext.text = 'Version ${Const.Version}\nBuilt for HaxeJam 2023: Winter Jam.\nCopyright (C) Saithir 2023';

    Main.musicResource = if( hxd.res.Sound.supportedFormat(Mp3)) hxd.Res.music.heartbeat else null;
    if(Main.musicResource != null){
      if (Main.playMusic) {
        Main.musicResource.play(true, 0.12);
      }
    }

    Main.drawSoundControls(s2d);
  }

  override function update(dt:Float) {
    // rotate our object every frame
    if( cloud_layer != null ) {
      cloud_layer.x -= 25 * dt;
      cloud_layer2.x -= 25 * dt;

      if (cloud_layer.x <= -1600) {
        cloud_layer.x = cloud_layer2.x + 1600;
      }

      if (cloud_layer2.x <= -1600) {
        cloud_layer2.x = cloud_layer.x + 1600;
      }
    }
  }

  static function main() {
    new Title();
  }
}
