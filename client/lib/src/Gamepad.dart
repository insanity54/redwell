part of terd;

class Gamepad extends Sprite {
  
  int _id;  // gamepad id number. Starts at 0. ex: player0 uses gamepad0, player1 uses gamepad1, etc.
  
  Gamepad(this._id) {
    // @todo
    
    this.create();
  }
  
  void update(){}
  void attack(){}

  void create() {
    // @todo
    // player just joined. gamepad is created

  }
  
  int get getId => _id;
}