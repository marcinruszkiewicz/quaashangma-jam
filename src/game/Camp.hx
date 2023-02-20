package game;

class Camp extends Scene {
  var bg:ui.TitleBackground;
  var description:ui.CampUi;

  override function init() {
    super.init();

    bg = new ui.TitleBackground(root, Const.DP_BG);
    description = new ui.CampUi(root, Const.DP_UI);

    new ui.SoundControls(root, Const.DP_UI);

    App.saveAll();
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
    new game.Camp();
  }
}
