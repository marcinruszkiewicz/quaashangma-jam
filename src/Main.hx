import Const;

class Main extends Scene {
  public static var instance:Scene;

  public static var floorplan:DungeonFloor;
  public static var currentFloor:Int = 1;
  public static var currentRooms:Int = 0;

  public static var HP:Int = 20;
  public static var maxHP:Int = 20;
  public static var gold:Int = 0;

  public static var maxVisitedFloor:Int = 1;

  public static var musicResource:hxd.res.Sound;
  public static var playMusic:Bool = true;
  public static var playSound:Bool = true;

  public static var musicButton:h2d.Bitmap;
  public static var soundButton:h2d.Bitmap;

  // see https://github.com/Yanrishatum/cherry-jam/blob/master/ld47/src/R.hx for hl
  static var SETTINGSPATH:String = "Quaashangma_jam/settings";
  static var SAVEPATH:String = "Quaashangma_jam/save";

  public static function drawSoundControls(screen:h2d.Scene) {
    var cfont = hxd.Res.fonts.alagard16.toFont();
    var checkboxtiles = hxd.Res.checkbox2.toTile();

    if (Main.playMusic) {
      musicButton = new h2d.Bitmap(checkboxtiles.sub(0, 0, 24, 24), screen);
    } else {
      musicButton = new h2d.Bitmap(checkboxtiles.sub(0, 24, 24, 24), screen);
    }
    musicButton.setPosition(4, 4);

    var musicText = new h2d.Text(cfont, screen);
    musicText.x = 30;
    musicText.y = 8;
    musicText.textColor = 0xFFFFFF;
    musicText.text = "Music";

    var musicint = new h2d.Interactive(38, 38, musicButton);
    musicint.onClick = function(_) {
      if (Main.playSound) {
        hxd.Res.sound.click1.play();
      }

      if (Main.playMusic) {
        Main.musicResource.stop();
        Main.playMusic = false;

        musicButton = new h2d.Bitmap(checkboxtiles.sub(0, 24, 24, 24), screen);
      } else {
        Main.musicResource.play(true, 0.12);
        Main.playMusic = true;

        musicButton = new h2d.Bitmap(checkboxtiles.sub(0, 0, 24, 24), screen);
      }
      musicButton.setPosition(4, 4);
      saveSettings();
    };
    musicint.onOver = function(_) {
      musicText.textColor = Const.hoverColor;
      if (Main.playSound) {
        hxd.Res.sound.click1.play();
      }
    };
    musicint.onOut = function(_) {
      musicText.textColor = 0xFFFFFF;
    };

    if (Main.playSound) {
      soundButton = new h2d.Bitmap(checkboxtiles.sub(0, 0, 24, 24), screen);
    } else {
      soundButton = new h2d.Bitmap(checkboxtiles.sub(0, 24, 24, 24), screen);
    }
    soundButton.setPosition(104, 4);

    var soundText = new h2d.Text(cfont, screen);
    soundText.x = 130;
    soundText.y = 8;
    soundText.textColor = 0xFFFFFF;
    soundText.text = "Sound";

    var soundint = new h2d.Interactive(38, 38, soundButton);
    soundint.onClick = function(_) {
      if (Main.playSound) {
        hxd.Res.sound.click1.play();
      }

      if (Main.playSound) {
        Main.playSound = false;

        soundButton = new h2d.Bitmap(checkboxtiles.sub(0, 24, 24, 24), screen);
      } else {
        Main.playSound = true;

        soundButton = new h2d.Bitmap(checkboxtiles.sub(0, 0, 24, 24), screen);
      }
      soundButton.setPosition(104, 4);
      saveSettings();
    };
    soundint.onOver = function(_) {
      soundText.textColor = Const.hoverColor;
      if (Main.playSound) {
        hxd.Res.sound.click1.play();
      }
    };
    soundint.onOut = function(_) {
      soundText.textColor = 0xFFFFFF;
    };
  }

  public static function saveAll() {
    hxd.Save.save({
      maxHP: maxHP,
      maxVisitedFloor: maxVisitedFloor,
      gold: gold
    }, SAVEPATH);
  }

  public static function saveSettings() {
    hxd.Save.save({
      music: playMusic,
      sound: playSound
    }, SETTINGSPATH);
  }

  public static function loadAll() {
    var data = hxd.Save.load(null, SAVEPATH);
    if (data != null) {
      maxHP = data.maxHP;
      maxVisitedFloor = data.maxVisitedFloor;
      gold = data.gold;
    }
  }

  public static function loadSettings() {
    var data = hxd.Save.load(null, SETTINGSPATH);
    if (data != null) {
      playMusic = data.music;
      playSound = data.sound;
    }
  }

  static function main() {
    hxd.Res.initEmbed();

    loadSettings();
    loadAll();
    Main.instance = new Title();
  }
}
