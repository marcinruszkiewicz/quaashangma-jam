package aevi_engine;

class Assets {
  public static var font32 : h2d.Font;
  public static var font24 : h2d.Font;
  public static var font16 : h2d.Font;
  public static var graphics : aseprite.Aseprite;
  public static var music:hxd.res.Sound;

  static var _initDone = false;
  public static function init() {
    if (_initDone) return;
    _initDone = true;

    // Fonts
    font32 = hxd.Res.fonts.alagard32.toFont();
    font24 = hxd.Res.fonts.alagard24.toFont();
    font16 = hxd.Res.fonts.alagard16.toFont();

    graphics = hxd.Res.atlas.graphics.toAseprite();

    music = if( hxd.res.Sound.supportedFormat(Mp3)) hxd.Res.music.heartbeat else null;
    if(music != null){
      if (App.playMusic) {
        music.play(true, 0.12);
      }
    }
  }
}
