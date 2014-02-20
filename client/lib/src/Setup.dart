part of terd;

class Setup extends Sprite {
  
  ResourceManager _resourceManager;
  Juggler _juggler;
  
  SimpleButton _startButton;
  Sprite _textLayer;
  
  List<Gamepad> _gamepads;  // list of all our gamepad objects 
  JsObject _gamepadSupport; // our proxy to gamepad.js
  int _numGamepads = 0;     // number of gamepads connected    
  int _maxGamepads = 3;     // Human-readable natural number of gamepads there needs to be

  
  Setup(ResourceManager this._resourceManager, Juggler this._juggler) {

    _gamepads = new List<Gamepad>();
    
    JsObject _gamepadSupport = context['gamepadSupport'];
    //new JsObject(context['gamepadSupport']);
    print(' button count: ');
    print(_gamepadSupport['TYPICAL_BUTTON_COUNT']);
    
    print(' init');
    _gamepadSupport.callMethod('init', []);
    
    print('INFO:  Please connect ${_maxGamepads.toString()} gamepads.');
    
    while ( _numGamepads <= _maxGamepads - 1 ) {
      // while there are less than three players
      _gamepadSupport.callMethod('pollGamepads', []);  // poll gamepad.js
      
      JsObject gp; // gamepad
      for (gp in _gamepadSupport['gamepads']){

        int i = gp['index'];
        
        try {
          // if this gamepad index already has a Gamepad class instance with the same id
          _gamepads[i].getId;
          
        } catch (e) {
          print('no gamepad with id ${i}');
          _gamepads.add(new Gamepad(i));
          
          print('added gamepad ${i}');
          _numGamepads++;
        }
      } 
    }

    print('INFO:  done with gamepads');     
    
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