package ui;

class GameBackground extends UiElement {
  public function new(root:h2d.Layers, layer:Int) {
    super(root, layer);

    var tile = Assets.graphics.getSlice('stone', 0).tile;
    var bg = new h2d.TileGroup(tile, root);
    for (x in 0...6) {
      for(y in 0...6) {
        bg.add(x*128, y*128, tile);
      }
    }
  }
}
