part of terd;

abstract class Mob extends Sprite {
  // Mob facts
  //   - Able to move up down left right
  //   - Have hitpoints
  //   - Have a sprite sheet
  //   - have associated sounds
  int _health;
  int _x;
  int _y;
  int _id;
  
  Mob() {
    // @todo
  }
  
  void update();
  
  void attack();
  
  void setXY(int x, int y) {
    _x = x;
    _y = y;
  }
  
  bool damage(int amt) {
    _health -= amt;
    return _health <= 0;
  }
  
  int get getId => _id;
}