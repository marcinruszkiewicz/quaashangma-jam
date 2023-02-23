package game;

class DungeonFloor {
  public var floor:Int;
  public var rooms:Array<Array<Int>>;
  public var exit_path:Array<Int>;
  public var visited:Array<Array<Int>>;

  /**
   * Generates a dungeon of a set depth with 4 random roons in each set
   *
   * >>> new game.DungeonFloor(0).rooms == [[~/[0-4]/, ~/[0-4]/, ~/[0-4]/, ~/[0-4]/], [~/[0-4]/, ~/[0-4]/, ~/[0-4]/, ~/[0-4]/], [~/[0-4]/, ~/[0-4]/, ~/[0-4]/, ~/[0-4]/]];
   *
   * Generates a random exit path
   *
   * >>> new game.DungeonFloor(0).exit_path == [~/[0-4]/, ~/[0-4]/, ~/[0-4]/]
   *
   * Clears visited rooms
   *
   * >>> new game.DungeonFloor(0).visited == [[0, 0, 0 ,0], [0, 0, 0 ,0], [0, 0, 0 ,0]]
   **/
  public function new(floor_num:Int) {
    var depth = 3 + floor_num;

    floor = floor_num;
    rooms = [ for (flr in 0...depth) [ for (rooms in 0...4) Std.random(4) ]];
    exit_path = [for (flr in 0...depth) Std.random(4)];

    var next_level_exit = exit_path[depth - 1];
    rooms[depth - 1][next_level_exit] = 4;

    visited = [ for (flr in 0...depth) [ for (rooms in 0...4) 0]];
  }

  /**
   * Visited rooms return true
   *
   * >>> ({
   * ...   var dungeon = new game.DungeonFloor(0);
   * ...   dungeon.visited[0][1] = 1;
   * ...   dungeon.is_visited(0, 1);
   * ... }) == true
   *
   * Unvisited room return false
   *
   * >>> new game.DungeonFloor(0).is_visited(0, 1) == false
   *
   **/
  public function is_visited(set:Int, room:Int) {
    return visited[set][room] == 1;
  }
}
