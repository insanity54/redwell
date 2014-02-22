part of terd;

class Game extends Sprite {

  ResourceManager _resourceManager;
  Juggler _juggler;
  List<Gamepad> _gamepads;
  
  SimpleButton _testButton;
  TimeGauge _timeGauge;
  TextField _testText;
  
  int _level;
  int _powerup;
  int _points;
  
  Sprite _pointLayer;
  
  Game(this._resourceManager, this._juggler, this._gamepads) {


    
    Bitmap testButtonNormal = new Bitmap(_resourceManager.getBitmapData("testButtonNormal"));
    Bitmap testButtonPressed = new Bitmap(_resourceManager.getBitmapData("testButtonPressed"));
    
    _testButton = new SimpleButton(testButtonNormal, testButtonNormal, testButtonPressed, testButtonPressed);
    _testButton.addEventListener(MouseEvent.CLICK, _onTestButtonClick);
    _testButton.x = 5;
    _testButton.y = 5;
    addChild(_testButton);
    
    _pointLayer = new Sprite();
    addChild(_pointLayer);
    
    
    MobHandler mobHandler = new MobHandler();   
    Gunner gunner = new Gunner(_resourceManager, _juggler);
    Puncher puncher = new Puncher(_resourceManager, _juggler);
    Sworder sworder = new Sworder(_resourceManager, _juggler);
    
 
    addChild(gunner);
    
    
    
    print(mobHandler.list);
  }
  
  void start() {
    print('game::start');
    _level = 1;
    _points = 0;


    MessageBox pointBox = new MessageBox(_resourceManager, _juggler, _resourceManager.getText("ESCStartText"));
    _pointLayer.addChild(pointBox);

    pointBox.show(() => _juggler.delayCall(() => _nextLevel(), 0.5));
    
    
    
    
    
    
    
  }
  
  void _nextLevel() {
    print('next level');
  }
  
  void _onTestButtonClick(MouseEvent me) {
    print("onTestButtonClick");

//    if (_board != null && _shuffles > 0) {
//
//      bool shuffled = _board.shuffleField();
//
//      if (shuffled) {
//        //_logger.info("shuffled");
//
//        _shuffles = _shuffles - 1;
//        _shufflesTextField.text = "${_shuffles}x";
//      }
//    }
  }
}

