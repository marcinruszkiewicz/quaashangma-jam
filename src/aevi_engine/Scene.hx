package aevi_engine;

class Scene extends hxd.App {
  var root:h2d.Layers;

  override function init() {
    Assets.init();

    s2d.scaleMode = Stretch(Const.W, Const.H);

    root = new h2d.Layers(s2d);
    root.filter = new h2d.filter.Nothing();
    root.visible = true;
  }

  override function update(dt:Float) {
    super.update(dt);
  }
}
