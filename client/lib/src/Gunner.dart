part of terd;

class Gunner extends Player {
  
  // Gunner facts:
  //   - Shoots bullets in the direction the gunner is facing
  
  List<BitmapData> _gunnerBitmapDatas;
  
  
  Gunner(resourceManager, juggler) : super(resourceManager, juggler) {
    
    _gunnerBitmapDatas = GraphicsHandler.getCharacter(_resourceManager, "gramps");
    Bitmap _gunnerBitmap = new Bitmap(_gunnerBitmapDatas.first);
    addChild(_gunnerBitmap);
  }
  
  void up() {
    
  }
  
  void attack() {

  }
  
  void update() {
    
  }
}