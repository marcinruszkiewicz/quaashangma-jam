package game;

class FloorTransition extends Scene {
  override function init() {
    super.init();

    new ui.GameBackground(root, Const.DP_BG);

    new ui.SoundControls(root, Const.DP_UI);
    new ui.BetweenFloors(root, Const.DP_UI);
  }

  static function main() {
    new game.FloorTransition();
  }
}
