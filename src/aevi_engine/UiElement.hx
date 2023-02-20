package aevi_engine;

class UiElement extends h2d.Object {
  public function new(root:h2d.Layers, layer:Int) {
    super();
    root.add(this, layer);
  }
}
