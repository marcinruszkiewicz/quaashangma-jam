package ui;

class BetweenFloors extends UiElement {
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
    description.text = Const.TransitionText;
    description.textColor = Const.textColor;
    description.maxWidth = 730;

    var backbutton = Assets.graphics.toScaleGrid("orange", 0, descriptionbg);
    backbutton.width = 260;
    backbutton.height = 48;
    backbutton.x = 50;
    backbutton.y = 180;

    var backText = new h2d.Text(Assets.font32, backbutton);
    backText.text = "Return to Camp";
    backText.textColor = Const.textColor;
    backText.textAlign = Center;
    backText.x = backbutton.width / 2 ;
    backText.y = 8;

    var backint = new h2d.Interactive(260, 48, backbutton);
    backint.onClick = function(_) {
      if (App.playSound) {
        hxd.Res.sound.click1.play();
      }

      App.currentFloor = 1;
      App.currentRooms = 0;
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

    var continuebutton = Assets.graphics.toScaleGrid("yellow", 0, descriptionbg);
    continuebutton.width = 260;
    continuebutton.height = 48;
    continuebutton.x = 458;
    continuebutton.y = 180;

    var continueText = new h2d.Text(Assets.font32, continuebutton);
    continueText.text = "Continue";
    continueText.textColor = Const.textColor;
    continueText.textAlign = Center;
    continueText.x = continuebutton.width / 2 ;
    continueText.y = 8;

    var continueint = new h2d.Interactive(260, 48, continuebutton);
    continueint.onClick = function(_) {
      if (App.playSound) {
        hxd.Res.sound.click1.play();
      }

      App.currentFloor++;
      App.currentRooms = 0;
      if (App.currentFloor > App.maxVisitedFloor) {
        App.maxVisitedFloor = App.currentFloor;
      }
      App.instance = new game.Game();
    };
    continueint.onOver = function(_) {
      continueText.textColor = Const.hoverColor;
      if (App.playSound) {
        hxd.Res.sound.click1.play();
      }
    };
    continueint.onOut = function(_) {
      continueText.textColor = Const.textColor;
    };
  }
}
