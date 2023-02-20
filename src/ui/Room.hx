package ui;

class Room extends UiElement {
  public var button:h2d.Interactive;
  public var image:h2d.Bitmap;
  public var description:String;

  var visited_icon:h2d.Bitmap;
  var exit_icon:h2d.Bitmap;

  public function new(root:h2d.Layers, layer:Int, parent:h2d.Object, room_type:String) {
    super(root, layer);

    var graphics_rand = Std.random(3);

    image = new h2d.Bitmap(hxd.Res.loader.load('rooms/$room_type/$graphics_rand.png').toTile(), parent);
    image.width = 230;
    image.x = 10;
    image.y = 10;

    visited_icon = new h2d.Bitmap(Assets.graphics.getSlice("checkmark").tile, image);
    visited_icon.setPosition(2, 170);
    visited_icon.visible = false;

    exit_icon = new h2d.Bitmap(Assets.graphics.getSlice("door").tile, image);
    exit_icon.setPosition(170, 170);
    exit_icon.visible = false;

    button = new h2d.Interactive(230, 230, image);
    button.onOver = function(_) {
      image.color = h3d.Vector.fromArray([0.9, 0.9, 0, 0.2]);
      image.blendMode = Screen;
    }
    button.onOut = function(_) {
      image.color = h3d.Vector.fromArray([1, 1, 1, 1]);
      image.blendMode = Alpha;
    }

    description = switch(room_type) {
      case 'empty':
        Const.EmptyRoomText[Std.random(Const.EmptyRoomText.length)];
      case 'monster':
        Const.MonsterRoomText[Std.random(Const.MonsterRoomText.length)];
      case 'treasure':
        Const.TreasureRoomText[Std.random(Const.TreasureRoomText.length)];
      case 'trap':
        Const.TrapRoomText[Std.random(Const.TrapRoomText.length)];
      case 'exit':
        Const.ExitRoomText[Std.random(Const.ExitRoomText.length)];
      case _:
        "There's nothing here.";
    }
  }

  public function showVisited() {
    visited_icon.visible = true;
  }

  public function showExit() {
    exit_icon.visible = true;
  }
}
