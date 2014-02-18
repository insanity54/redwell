part of terd;

abstract class Player extends Mob {
  // Player facts
  //   - controllable via usb gamepad
  //   - keeps a score
  //   - has account
  //   - has powerups
  
  int _id;      // player ID number (0-3)
  
  Player() {
    print('hello player ' + _id.toString());
    if ( _id == null ) {
      _id = super.getId + 1;
    }
  }
  
  void attack();
  
  void update();
  
  int get id => _id;
}