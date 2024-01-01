import 'dart:async';
import 'dart:ui';
import 'package:adventure/levels/level.dart';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class Adventure extends FlameGame{
  @override
  Color backgroundColor() => Colors.black;
  
  late final CameraComponent cam;
  final basicWorld = Level(levelName: 'level_02');

  @override
    FutureOr<void> onLoad() async{

    await images.loadAllImages();//into cache

    cam = CameraComponent.withFixedResolution(
        world: basicWorld, width: 360, height: 760);
    cam.viewfinder.anchor = Anchor.topLeft;
    addAll([cam, basicWorld]);
      return super.onLoad();
    }

}