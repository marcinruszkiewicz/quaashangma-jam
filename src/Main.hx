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

  static function main() {
    hxd.Res.initEmbed();

    Main.instance = new Title();
  }
}
