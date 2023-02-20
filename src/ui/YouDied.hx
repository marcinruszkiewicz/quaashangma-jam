package ui;

class YouDied extends UiElement {
  public var description:h2d.Text;

  public function new(root:h2d.Layers, layer:Int) {
    super(root, layer);

    var layout = new h2d.Layers(App.instance.s2d);
    layout.y = 200;

    var header = Assets.graphics.toScaleGrid("header", 0);
    header.width = 350;
    header.height = 80;
    header.x = Const.W / 2 - 175;
    header.y = 0;
    layout.add(header, 2);

    var skull = new h2d.Bitmap(Assets.graphics.getSlice("skull").tile, header);
    skull.x = 175 - 68;
    skull.y = -30;

    var descriptionbg = Assets.graphics.toScaleGrid("lightwin", 0);
    descriptionbg.width = 768;
    descriptionbg.height = 250;
    descriptionbg.y = 60;
    layout.add(descriptionbg, 1);

    var title = new h2d.Text(Assets.font32, header);
    title.x = 175;
    title.y = 22;
    title.textColor = Const.textColor;
    title.textAlign = Center;
    title.text = 'Floor ${App.currentFloor}';

    var description = new h2d.Text(Assets.font24, descriptionbg);
    description.x = 20;
    description.y = 30;
    description.text = Const.EscapeText;
    description.textColor = Const.textColor;
    description.maxWidth = 730;

    var backbutton = Assets.graphics.toScaleGrid("orange", 0, descriptionbg);
    backbutton.width = 300;
    backbutton.height = 48;
    backbutton.x = 234;
    backbutton.y = 180;

    var backText = new h2d.Text(Assets.font32, backbutton);
    backText.text = "Wake up in Camp";
    backText.textColor = Const.textColor;
    backText.textAlign = Center;
    backText.x = backbutton.width / 2 ;
    backText.y = 8;

    var backint = new h2d.Interactive(260, 48, backbutton);
    backint.onClick = function(_) {
      if (App.playSound) {
        hxd.Res.sound.click1.play();
      }
      App.instance = new game.Camp();
    };
    backint.onOver = function(_) {
      backText.textColor = Const.hoverColor;
      if (App.playSound) {
        hxd.Res.sound.click1.play();
      }
    };
    backint.onOut = function(_) {
      backText.textColor = Const.textColor;
    };
  }
}
