library terd;

import 'dart:async';
import 'dart:math';
import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'dart:js';

part 'src/Setup.dart'; // screen where players join the game
part 'src/Mob.dart';
part 'src/Player.dart'; 
part 'src/Gamepad.dart';
part 'src/Game.dart';
part 'src/MessageBox.dart';


class Terd extends Sprite {

  ResourceManager _resourceManager;
  Juggler _juggler;

  Terd(ResourceManager resourceManager) {
    _resourceManager = resourceManager;
    this.onAddedToStage.listen(_onAddedToStage);
  }

  
  _onAddedToStage(Event e) {
    print('terd::_onaddedtostage');
    var setup = new Setup(_resourceManager, _juggler);
    addChild(setup);
    setup.start();


    
//    _juggler = stage.juggler;
//    print('terd::_onaddedtostage');
//    var game = new Game(_resourceManager, _juggler);
//    addChild(new Bitmap(_resourceManager.getBitmapData("background")));
//    addChild(game);
//    game.start();
  }
}
