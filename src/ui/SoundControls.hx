package ui;

class SoundControls extends UiElement {
  var flow: h2d.Flow;

  public function new(root:h2d.Layers, layer:Int) {
    super(root, layer);

    flow = new h2d.Flow(App.instance.s2d);
    flow.layout = Horizontal;
    flow.verticalAlign = Middle;
    flow.horizontalSpacing = 5;
    flow.x = 4;
    flow.y = 4;
    flow.maxHeight = 200;
    flow.maxWidth = Const.W;

    var checkM = new h2d.Bitmap(Assets.graphics.getSlice("checkbox").tile, flow);
    if (App.playMusic) {
      checkM.tile = Assets.graphics.getSlice("checked").tile;
    }
    var musicText = new h2d.Text(Assets.font16, flow);
    musicText.textColor = 0xFFFFFF;
    musicText.text = "Music";

    var checkS = new h2d.Bitmap(Assets.graphics.getSlice("checkbox").tile, flow);
    if (App.playSound) {
      checkS.tile = Assets.graphics.getSlice("checked").tile;
    }
    var soundText = new h2d.Text(Assets.font16, flow);
    soundText.textColor = 0xFFFFFF;
    soundText.text = "Sound";

    var musicint = new h2d.Interactive(30, 30, checkM);
    musicint.onClick = function(_) {
      if (App.playSound) {
        hxd.Res.sound.click1.play();
      }

      if (App.playMusic) {
        Assets.music.stop();
        App.playMusic = false;

        checkM.tile = Assets.graphics.getSlice("checkbox").tile;
      } else {
        Assets.music.play(true, 0.12);
        App.playMusic = true;

        checkM.tile = Assets.graphics.getSlice("checked").tile;
      }
      App.saveSettings();
    };
    musicint.onOver = function(_) {
      musicText.textColor = Const.hoverColor;
      if (App.playSound) {
        hxd.Res.sound.click1.play();
      }
    };
    musicint.onOut = function(_) {
      musicText.textColor = 0xFFFFFF;
    };

    var soundint = new h2d.Interactive(30, 30, checkS);
    soundint.onClick = function(_) {
      if (App.playSound) {
        hxd.Res.sound.click1.play();
      }

      if (App.playSound) {
        App.playSound = false;
        checkS.tile = Assets.graphics.getSlice("checkbox").tile;
      } else {
        App.playSound = true;
        checkS.tile = Assets.graphics.getSlice("checked").tile;
      }
      App.saveSettings();
    };
    soundint.onOver = function(_) {
      soundText.textColor = Const.hoverColor;
      if (App.playSound) {
        hxd.Res.sound.click1.play();
      }
    };
    soundint.onOut = function(_) {
      soundText.textColor = 0xFFFFFF;
    };
  }
}
