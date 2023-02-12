class Const {
  public static inline var Version = '0.2';
  public static inline var W = 768;
  public static inline var H = 768;
  public static var RoomPositions = [[260, 89], [7, 342], [260, 342], [514, 342]];
  public static var RoomButtonSize = [246, 246];
  public static var floorUIPosition = [384, 45];
  public static var campUIPosition = [384, 45];
  public static var hpUIPosition = [28, 100];
  public static var goldUIPosition = [528, 100];
  public static var floorTransitionUIPosition = [384, 200];
  public static var descriptionPosition = [28, 620];
  public static var descriptionTransitionPosition = [28, 264];

  public static var descriptionCampPosition = [28, 100];
  public static var campHpUIPosition = [28, 50];
  public static var campGoldUIPosition = [560, 50];
  public static var entranceAPosition = [130, 357];
  public static var entranceBPosition = [384, 357];
  public static var entranceCPosition = [638, 357];
  public static var entranceAImagePosition = [12, 400];
  public static var entranceBImagePosition = [268, 400];
  public static var entranceCImagePosition = [524, 400];

  public static var textColor = 0x271f1b;
  public static var hoverColor = 0x9f4a1f;
  public static var DefaultText = "You're standing in a dungeon. There are rooms on all sides, but which one should you choose?";
  public static var TransitionText = "The Return Crystal glows with a white light as you descend to the next floor of the dungeon.\n\nYou can return to the Camp from here.";
  public static var EscapeText = "The Return Crystal glows red as you fall defeated to the ground, losing all your gold and items.";

  public static var EmptyRoomText = [
    "This room looks like it's empty.",
    "There isn't anything interesting here.",
    "Not much to see here."
  ];

  public static var TrapRoomText = [
    "You hear a swoosh and a giant blade comes out from the wall.",
    "You hear a *click* when you step on a stone.",
    "There's a spiked pit in the middle of the room."
  ];

  public static var MonsterRoomText = [
    "You're under attack!",
    "The Demons in this room are circling around you.",
    "A Demon blocks your way out."
  ];

  public static var TreasureRoomText = [
    "You find a big treasure chest in this room.",
    "A pile of bones and random crap is here.",
    "There are piles of gold and treasure here."
  ];

  public static var ExitRoomText = [
    "There's a great doorway on one of the walls. Maybe it's the way down?",
    "Looks like you found the stairway leading down. Does this dungeon ever end?",
    "The stairs leading down look a bit ruined, but should be stable enough to proceed."
  ];
}
