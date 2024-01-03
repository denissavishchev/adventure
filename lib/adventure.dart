import 'dart:async';
import 'package:adventure/levels/level.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'actors/player.dart';

class Adventure extends FlameGame with HasKeyboardHandlerComponents, DragCallbacks{
  @override
  Color backgroundColor() => Colors.grey;
  
  late final CameraComponent cam;
  Player player = Player(character: 'Mask Dude');
  late JoystickComponent joystick;
  bool showJoystick = false;

  @override
    FutureOr<void> onLoad() async{

    await images.loadAllImages();//into cache

    final basicWorld = Level(
        player: player,
        levelName: 'level_02'
    );

    cam = CameraComponent.withFixedResolution(
        world: basicWorld, width: 360, height: 760);
    cam.viewfinder.anchor = Anchor.topLeft;

    addAll([cam, basicWorld]);
    addJoystick();

      return super.onLoad();
    }

    @override
  void update(double dt) {
    updateJoystick();
    super.update(dt);
  }

    void addJoystick(){
      joystick = JoystickComponent(
        knob: SpriteComponent(
          sprite: Sprite(images.fromCache('HUD/Knob.png'))
        ),
        background: SpriteComponent(
          sprite: Sprite(images.fromCache('HUD/Joystick.png'))
        ),
        margin: const EdgeInsets.only(left: 128, bottom: 32)
      );
      add(joystick);
    }

    void updateJoystick(){
      switch(joystick.direction){
        case JoystickDirection.left:
        case JoystickDirection.upLeft:
        case JoystickDirection.downLeft:
          player.playerDirection = PlayerDirection.left;
          break;
        case JoystickDirection.right:
        case JoystickDirection.upRight:
        case JoystickDirection.downRight:
          player.playerDirection = PlayerDirection.right;
          break;
        default:
          player.playerDirection = PlayerDirection.none;
          break;
      }
    }

}