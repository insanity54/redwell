part of terd;

class Setup extends Sprite {
  
  ResourceManager _resourceManager;
  Juggler _juggler;
  
  SimpleButton _startButton;
  Sprite _textLayer;
  
  var _gamepadSupport;
  
 
  Setup(ResourceManager this._resourceManager, Juggler this._juggler) {

    print('setup');
    
    
    JsObject _gamepadSupport = context['gamepadSupport'];
        //new JsObject(context['gamepadSupport']);
    print(' button count: ');
    print(_gamepadSupport['TYPICAL_BUTTON_COUNT']);
    
    print(' init');

    

    _gamepadSupport.callMethod('init', []);

    print('passed');
    
    while (true) {

     _gamepadSupport.callMethod('pollGamepads', []);
      
      var gamepadArray = _gamepadSupport['gamepads'];
      
      if ( gamepadArray.length > 0 ) {
        print(gamepadArray[0]['buttons'][0]);
      }
    }
    
    
    print('passing');
    
    Bitmap startButtonNormal = new Bitmap(_resourceManager.getBitmapData("testButtonNormal"));
    Bitmap startButtonPressed = new Bitmap(_resourceManager.getBitmapData("testButtonPressed"));
    
    _startButton = new SimpleButton(startButtonNormal, startButtonNormal, startButtonPressed, startButtonPressed);
    _startButton.addEventListener(MouseEvent.CLICK, _onStartButtonClick);
    _startButton.x = 2;
    _startButton.y = 25;
    addChild(_startButton);
    print('addded start butt.');
    
    
  }
  
  void start() {
    print('setup::start');
        
    MessageBox textBox = new MessageBox(_resourceManager, _juggler, "player join");
    _textLayer.addChild(textBox);
  }
  
  void _onStartButtonClick(MouseEvent me) {
    // start game when the start button is clicked
    print("onStartButtonClick");
    this.removeChild(_startButton);
    
    _juggler = stage.juggler;
    var game = new Game(_resourceManager, _juggler);
    addChild(new Bitmap(_resourceManager.getBitmapData("background")));
    addChild(game);
    game.start();
    //this.parent.removeChild(this);
  }
}