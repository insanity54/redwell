part of terd;

class MobHandler {
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
