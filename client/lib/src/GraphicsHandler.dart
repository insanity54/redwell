part of terd;

class GraphicsHandler {
  
  static List<BitmapData> getCharacter(ResourceManager resourceManager, String character) {

    TextureAtlas textureAtlas = resourceManager.getTextureAtlas("${character}");
    
    List<BitmapData> char = new List<BitmapData>();
    
    char.add(textureAtlas.getBitmapData("standbackward"));
    char.add(textureAtlas.getBitmapData("standforward"));
    char.add(textureAtlas.getBitmapData("standleft"));
    char.add(textureAtlas.getBitmapData("walkbackward"));
    char.add(textureAtlas.getBitmapData("walkforward"));
    char.add(textureAtlas.getBitmapData("walkleft1"));
    char.add(textureAtlas.getBitmapData("walkleft2"));
    char.add(textureAtlas.getBitmapData("special"));

    return char;
  }
}