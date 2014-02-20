part of terd;

class Gamepad extends Player {
  
  //int _id;  // gamepad id number. Starts at 0. ex: player0 uses gamepad0, player1 uses gamepad1, etc.
  
  Gamepad(id) : super(id) {
    // @todo
    
    this.create();
  }
  
  void update(){}
  void attack(){}

  void create() {
    // @todo
    // player just joined. gamepad is created

  }
  
  int get id => _id;
}