part of terd;

class MobHandler {
  // Handles mob movement, attacks, damage, deletion. (@Jacob: Is that right?)
  
  // gamepad[0].up so that means mobHandler._objects[0].up
  
  
  // Uses a list to hold all the mobs.
  List<Mob> _objects;
  
  MobHandler(){
    _objects = new List<Mob>();
  }
  
  void addMob(Mob mob){
    _objects.add(mob);
  }
  
  void deleteMob(int index){
    _objects.removeAt(index);
  }
  
  void update(){}
  
  void render(){}
  
  String get list => _objects.toString();
}
