part of terd;

class Gamepad extends Player {
  
  var _id;  // gamepad id number. Starts at 0. ex: player0 uses gamepad0, player1 uses gamepad1, etc.
  
  Gamepad() {
    // @todo
    
    this.create();
  }


  void create() {
    // @todo
    // player just joined. gampad is created
    // something like _id = _id.length(); 
    _id = _id.length();
  }
}