package ui;

class Forward extends UiElement {
  public var button:h2d.Interactive;
  public var image:h2d.ScaleGrid;

  public function new(root:h2d.Layers, layer:Int, parent:h2d.ScaleGrid) {
    super(root, layer);

    image = Assets.graphics.toScaleGrid("yellow", 0, parent);
    image.width = 150;
    image.height = 48;
    image.x = parent.width / 2 - 75;
    image.y = parent.height - 70;

    var text = new h2d.Text(Assets.font32, image);
    text.text = "Forward";
    text.textColor = Const.textColor;
    text.textAlign = Center;
    text.x = image.width / 2 ;
    text.y = 8;

    button = new h2d.Interactive(150, 48, image);

    button.onOver = function(_) {
      text.textColor = Const.hoverColor;
      if (App.playSound) {
        hxd.Res.sound.click1.play();
      }
    };

    button.onOut = function(_) {
      text.textColor = Const.textColor;
    };
  }

  override function onRemove() {
    image.remove();
    super.onRemove();
  }
}
