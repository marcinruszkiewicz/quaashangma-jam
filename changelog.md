# 0.5

- post Jam version
- fix issues with text length by using a smaller fonts


# 0.4

- fix camp UI a bit
- add healing items drop from the monsters to help with game balance
- separate clouds from title background, animate clouds layer

# 0.3

- background music and controls for sound and music
- sounds
- save system

# 0.2

- title screen
  - better looking game title
  - select dungeon entrance with entrance buttons
  - generate dungeon entrance images

- game screen
  - mark room visited if it's not the right one
  - after clicking on the exit, show level transition screen
  - move the game UI down a bit, there's too much space on the bottom

- level transition screen
  - button to next level
    - reset the dungeon level and generate next one
  - use return crystal button
    - return to camp screen

- camp screen
  - convert gold to max hp so exploration gets easier
  - choose to start from further dungeon levels if you explored far enough

# 0.1

- title screen
  - background image
  - game title
  - click to start game

- init dungeon level
  - generate path to level exit
  - generate empty rooms with appropriate floor sizes, put exit on appropriate position in last set

- game screen
  - show rooms in the current set
  - assign rooms as buttons
  - if player clicks the correct one to move forward, render next set of rooms
