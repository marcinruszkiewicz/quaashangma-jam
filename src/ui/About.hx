package ui;

class About extends UiElement {
  public function new(root:h2d.Layers, layer:Int) {
    super(root, layer);

    var copytext = new h2d.Text(Assets.font16, root);
    copytext.x = 16;
    copytext.y = 700;
    copytext.textColor = 0xFFFFFF;
    copytext.text = 'Version ${Const.Version} (Post-Jam version)\nBuilt for HaxeJam 2023: Winter Jam.\nCopyright (C) Saithir 2023';
  }
}
