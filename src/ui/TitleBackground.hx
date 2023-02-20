package ui;

class TitleBackground extends UiElement {
  public var cloud_layer:h2d.Bitmap;
  public var cloud_layer2:h2d.Bitmap;

  public function new(root:h2d.Layers, layer:Int) {
    super(root, layer);

    cloud_layer = new h2d.Bitmap(hxd.Res.clouds.toTile());
    cloud_layer2 = new h2d.Bitmap(hxd.Res.clouds.toTile());
    var castle_layer = new h2d.Bitmap(hxd.Res.castle.toTile());
    cloud_layer2.x = 1600;

    root.add(cloud_layer, layer);
    root.add(cloud_layer2, layer);
    root.add(castle_layer, layer++);
  }
}
