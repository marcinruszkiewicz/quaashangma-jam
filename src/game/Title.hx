package game;

class Title extends Scene {
  var bg:ui.TitleBackground;

  override function init() {
    super.init();

    bg = new ui.TitleBackground(root, Const.DP_BG);

    new ui.SoundControls(root, Const.DP_UI);
    new ui.Start(root, Const.DP_UI);
    new ui.About(root, Const.DP_UI);
  }

  override function update(dt:Float) {
    super.update(dt);

    var tmod = hxd.Timer.tmod;

    bg.cloud_layer.x -= 0.5 * tmod;
    bg.cloud_layer2.x -= 0.5 * tmod;

    if (bg.cloud_layer.x <= -1600) {
      bg.cloud_layer.x = bg.cloud_layer2.x + 1600;
    }

    if (bg.cloud_layer2.x <= -1600) {
      bg.cloud_layer2.x = bg.cloud_layer.x + 1600;
    }
  }

  static function main() {
    new game.Title();
  }
}
