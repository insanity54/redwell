part of terd;

class MessageBox extends Sprite
{
  ResourceManager _resourceManager;
  Juggler _juggler;

  DelayedCall _showTimeout;
  Function _doneFunction;

  MessageBox(ResourceManager resourceManager, Juggler juggler, String text) {

    print("text: " + text);
    _resourceManager = resourceManager;
    _juggler = juggler;

    Bitmap background = new Bitmap(_resourceManager.getBitmapData("MessageBox"));
    addChild(background);

    TextField textField = new TextField();
    textField.defaultTextFormat = new TextFormat("Arial", 24, Color.Black, bold:true, align:TextFormatAlign.CENTER);
    print(textField.textHeight );
    textField.width = 512;
    textField.height = 100;
    textField.wordWrap = true;
    //textField.selectable = false;
    textField.text = text;
    textField.x = 4;
    textField.y = 30 - textField.textHeight / 2;
    //textField.filters = [new GlowFilter(0x000000, 0.7, 3, 3)];   // @todo
    textField.mouseEnabled = false;
    addChild(textField);

    _showTimeout = null;

    addEventListener(MouseEvent.CLICK, _onClick);
  }

  //----------------------------------------------------------------------
  //----------------------------------------------------------------------

  void show(Function doneFunction) {

    this.parent.addChild(this);  // move to top
    this.x = - this.width;
    this.y = 150;

    _doneFunction = doneFunction;

    Tween tween = new Tween(this, 0.3, TransitionFunction.easeOutCubic);
    tween.animate.x.to(110);
    tween.onComplete = () => _showTimeout = _juggler.delayCall(_hide, 10);

    _juggler.add(tween);
  }

  //----------------------------------------------------------------------

  void _hide() {

    if (_showTimeout != null) {

      _juggler.remove(_showTimeout);
      _showTimeout = null;

      _doneFunction();

      Tween tween = new Tween(this, 0.4, TransitionFunction.easeInCubic);
      tween.animate.x.to(800);
      tween.onComplete = () => this.parent.removeChild(this);

      _juggler.add(tween);
    }
  }

  //----------------------------------------------------------------------

  void _onClick(MouseEvent me) {
    _hide();
  }
}