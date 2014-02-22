part of terd;

abstract class Mob extends Sprite {
  // Mob facts
  //   - Able to move up down left right
  //   - Have hitpoints
  //   - Have a sprite sheet
  //   - have associated sounds
  
  ResourceManager _resourceManager;
  Juggler _juggler;
  
  int _health;
  int _x;
  int _y;
  int _id;
  
  Mob(this._resourceManager, this._juggler) {
    // @todo this constructor needs to generate a unique ID
    
    print('mob made');
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