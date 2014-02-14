import 'dart:html' as html;
import 'dart:math';
import 'package:stagexl/stagexl.dart';
import '../lib/terd.dart';



Stage stage;
RenderLoop renderLoop;

Bitmap loadingBitmap;
Tween loadingBitmapTween;
TextField loadingTextField;


void main() {
  
  stage = new Stage(html.querySelector('#stage'));
  renderLoop = new RenderLoop();
  renderLoop.addStage(stage);

  //BitmapData.defaultLoadOptions.webp = true;
  BitmapData.load("img/loading2.png").then((bitmapData) {

    loadingBitmap = new Bitmap(bitmapData);
    loadingBitmap.pivotX = 20;
    loadingBitmap.pivotY = 20;
    loadingBitmap.x = 400;
    loadingBitmap.y = 270;
    stage.addChild(loadingBitmap);

    loadingTextField = new TextField();
    loadingTextField.defaultTextFormat = new TextFormat("Arial", 20, 0xA0A0A0, bold:true);;
    loadingTextField.width = 340;
    loadingTextField.height = 40;
    loadingTextField.text = "... warming up the toaster ...";
    loadingTextField.x = 400 - loadingTextField.textWidth / 2;
    loadingTextField.y = 320;
    loadingTextField.mouseEnabled = false;
    stage.addChild(loadingTextField);

    loadingBitmapTween = new Tween(loadingBitmap, 100, TransitionFunction.linear);
    loadingBitmapTween.animate.rotation.to(100.0 * 2.0 * PI);
    renderLoop.juggler.add(loadingBitmapTween);
  
  });
  
  loadResources();
}

void loadResources() {
  
  var resourceManager = new ResourceManager();
  
//  resourceManager.onProgress.listen((e) {
//    var finished = resourceManager.finishedResources;
//    var pending = resourceManager.pendingResources;
//    var failed = resourceManager.failedResources;
//    print("Resource Progress -> finished: ${finished.length}, pending:${pending.length}, failed:${failed.length}");
//  });
  
  resourceManager.addBitmapData("toaster", "img/toaster.png");
  resourceManager.addBitmapData("background", "img/background.png");
  resourceManager.addBitmapData("testButtonNormal", "img/button_normal.png");
  resourceManager.addBitmapData("testButtonPressed", "img/button_press.png");
  resourceManager.addBitmapData("MessageBox", "img/messagebox.png");
  
  resourceManager.addText("ESCStartText", "Form horizontal or vertical same-colour chains and become an escape agent!");
  
  resourceManager.load().then((res) {
    
    stage.removeChild(loadingBitmap);
    stage.removeChild(loadingTextField);
    renderLoop.juggler.remove(loadingBitmapTween);
    
    stage.addChild(new Terd(resourceManager));

  }).catchError((error) {

    for(var resource in resourceManager.failedResources) {
      print("Loading resouce failed: ${resource.kind}.${resource.name} - ${resource.error}");
    }
  });
}