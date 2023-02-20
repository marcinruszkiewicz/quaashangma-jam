package ui;

class Start extends UiElement {
  var flow: h2d.Flow;

  public function new(root:h2d.Layers, layer:Int) {
    super(root, layer);

    flow = new h2d.Flow(App.instance.s2d);
    flow.layout = Vertical;
    flow.verticalSpacing = 0;
    flow.horizontalAlign = Middle;
    flow.x = Const.W / 2 - 175;
    flow.y = 400;
    flow.maxWidth = 400;
    flow.maxHeight = 400;

    var header = Assets.graphics.toScaleGrid("header", 0, flow);
    header.width = 350;
    header.height = 80;

    var headerText = new h2d.Text(Assets.font32, header);
    headerText.text = "Quaashangma";
    headerText.textColor = Const.textColor;
    headerText.textAlign = Center;
    headerText.x = header.width / 2 ;
    headerText.y = 22;

    var skull = new h2d.Bitmap(Assets.graphics.getSlice("skull").tile, header);
    skull.x = 175 - 68;
    skull.y = -30;

    var start = Assets.graphics.toScaleGrid("yellow", 0, flow);
    start.width = 150;
    start.height = 48;

    var startText = new h2d.Text(Assets.font32, start);
    startText.text = "Start";
    startText.textColor = Const.textColor;
    startText.textAlign = Center;
    startText.x = start.width / 2 ;
    startText.y = 8;

    var startint = new h2d.Interactive(150, 48, start);
    startint.onClick = function(_) {
      if (App.playSound) {
        hxd.Res.sound.click1.play();
      }
      App.instance = new game.Camp();
    };

    startint.onOver = function(_) {
      startText.textColor = Const.hoverColor;
      if (App.playSound) {
        hxd.Res.sound.click1.play();
      }
    };

    startint.onOut = function(_) {
      startText.textColor = Const.textColor;
    };
  }
}
