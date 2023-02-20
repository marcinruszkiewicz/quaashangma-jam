package ui;

class GameUi extends UiElement {
  public var description:h2d.Text;
  public var hp:h2d.Text;
  public var gold:h2d.Text;
  public var title:h2d.Text;
  var layout:h2d.Layers;

  public var roomtop:h2d.ScaleGrid;
  public var roombottom:h2d.ScaleGrid;
  public var roomleft:h2d.ScaleGrid;
  public var roomright:h2d.ScaleGrid;
  public var statsleft:h2d.ScaleGrid;
  public var forward_button:ui.Forward;

  public function new(root:h2d.Layers, layer:Int) {
    super(root, layer);

    layout = new h2d.Layers(App.instance.s2d);
    layout.y = 10;
    layout.x = 0;

    statsleft = Assets.graphics.toScaleGrid("lightwin", 0);
    statsleft.width = 250;
    statsleft.height = 250;
    statsleft.x = Const.W / 2 - 125 - 240;
    statsleft.y = 100;
    layout.add(statsleft, 0);

    var statsright = Assets.graphics.toScaleGrid("lightwin", 0);
    statsright.width = 250;
    statsright.height = 250;
    statsright.x = Const.W / 2 + 115;
    statsright.y = 100;
    layout.add(statsright, 0);

    var descbox = Assets.graphics.toScaleGrid("lightwin", 0);
    descbox.width = 750;
    descbox.height = 170;
    descbox.x = Const.W / 2 - 375;
    descbox.y = 580;
    layout.add(descbox, 0);

    var header = Assets.graphics.toScaleGrid("header", 0);
    header.width = 350;
    header.height = 80;
    header.x = Const.W / 2 - 175;
    header.y = 40;
    layout.add(header, 1);

    title = new h2d.Text(Assets.font32, header);
    title.x = 175;
    title.y = 22;
    title.textColor = Const.textColor;
    title.textAlign = Center;

    var skull = new h2d.Bitmap(Assets.graphics.getSlice("skull").tile, header);
    skull.x = 175 - 68;
    skull.y = -30;

    roomtop = Assets.graphics.toScaleGrid("darkwin", 0);
    roomtop.width = 250;
    roomtop.height = 250;
    roomtop.x = Const.W / 2 - 125;
    roomtop.y = 98;
    layout.add(roomtop, 2);

    roombottom = Assets.graphics.toScaleGrid("darkwin", 0);
    roombottom.width = 250;
    roombottom.height = 250;
    roombottom.x = Const.W / 2 - 125;
    roombottom.y = 340;
    layout.add(roombottom, 2);

    roomleft = Assets.graphics.toScaleGrid("darkwin", 0);
    roomleft.width = 250;
    roomleft.height = 250;
    roomleft.x = Const.W / 2 - 125 - 250 + 5;
    roomleft.y = 340;
    layout.add(roomleft, 2);

    roomright = Assets.graphics.toScaleGrid("darkwin", 0);
    roomright.width = 250;
    roomright.height = 250;
    roomright.x = Const.W / 2 + 120;
    roomright.y = 340;
    layout.add(roomright, 2);

    hp = new h2d.Text(Assets.font24, statsleft);
    hp.x = 20;
    hp.y = 25;
    hp.textColor = Const.textColor;

    gold = new h2d.Text(Assets.font24, statsright);
    gold.x = 20;
    gold.y = 25;
    gold.textColor = Const.textColor;

    description = new h2d.Text(Assets.font24, descbox);
    description.x = 20;
    description.y = 25;
    description.textColor = Const.textColor;
    description.maxWidth = 730;
  }
}
