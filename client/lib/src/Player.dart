part of terd;

abstract class Player extends Mob {
  // Player facts
  //   - controllable via usb gamepad
  //   - keeps a score
  //   - has account
  //   - has powerups
  //   - can move up, down, left right
  //   - attacks in the direction they're facing
    
  Player(resourceManager, juggler) : super(resourceManager, juggler) {
    //print('hello player ' + _id.toString());
//    if ( _id == null ) {
//      _id = super.getId + 1;
//    }
  }
  
  void attack();
  
  void update();
  
  int get id => _id;
}