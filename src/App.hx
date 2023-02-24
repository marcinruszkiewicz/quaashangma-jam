class App extends hxd.App {
  public static var instance:Scene;

  public static var playMusic:Bool = true;
  public static var playSound:Bool = true;

  public static var floorplan:game.DungeonFloor;
  public static var currentFloor:Int = 1;
  public static var currentRooms:Int = 0;

  public static var HP:Int = 20;
  public static var maxHP:Int = 20;
  public static var gold:Int = 0;

  public static var maxVisitedFloor:Int = 1;

  #if hl
    static var SETTINGSPATH:String = Path.join([Sys.getEnv("APPDATA"), "Aevi/", "Quaashangma", "/settings"]);
    static var SAVEPATH:String = Path.join([Sys.getEnv("APPDATA"), "Aevi/", "Quaashangma", "/save"]);
  #else
    static var SETTINGSPATH:String = "Quaashangma-jam/settings";
    static var SAVEPATH:String = "Quaashangma-jam/save";
  #end

  public static function saveAll() {
    #if hl
      sys.FileSystem.createDirectory(Path.directory(SAVEPATH));
    #end
    hxd.Save.save({
      maxHP: maxHP,
      maxVisitedFloor: maxVisitedFloor,
      gold: gold
    }, SAVEPATH);
  }

  public static function saveSettings() {
    #if hl
      sys.FileSystem.createDirectory(Path.directory(SETTINGSPATH));
    #end
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
    #if (hl && debug)
      hxd.Res.initLocal();
    #elseif (hl && !debug)
      hxd.Res.initPak();
    #else
      hxd.Res.initEmbed();
    #end

    loadSettings();
    loadAll();
    App.instance = new game.Title();
  }
}
