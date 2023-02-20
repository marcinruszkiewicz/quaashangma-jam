class App extends hxd.App {
  public static var instance:Scene;

  public static var playMusic:Bool = false;
  public static var playSound:Bool = false;

  public static var floorplan:game.DungeonFloor;
  public static var currentFloor:Int = 1;
  public static var currentRooms:Int = 0;

  public static var HP:Int = 20;
  public static var maxHP:Int = 20;
  public static var gold:Int = 0;

  public static var maxVisitedFloor:Int = 1;

  static var SETTINGSPATH:String = "Quaashangma-jam/settings";
  static var SAVEPATH:String = "Quaashangma-jam/save";

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
    App.instance = new game.Title();
  }
}
