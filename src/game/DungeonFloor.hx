package game;

class DungeonFloor {
  public var rooms:Array<Array<Int>>;
  public var exit_path:Array<Int>;
  public var floor:Int;

  public var visited:Array<Array<Int>>;

  public function new(floor_num : Int) {
    // trace('generating dungeon for floor $floor_num');
    var depth = 3 + floor_num;

    floor = floor_num;
    rooms = [ for (flr in 0...depth) [ for (rooms in 0...4) Std.random(4) ]];
    exit_path = [for (flr in 0...depth) Std.random(4)];

    var next_level_exit = exit_path[depth - 1];
    rooms[depth - 1][next_level_exit] = 4;

    visited = [ for (flr in 0...depth) [ for (rooms in 0...4) 0]];
  }

  public function is_visited(set:Int, room:Int) {
    return visited[set][room] == 1;
  }
}
