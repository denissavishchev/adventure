import 'package:adventure/adventure.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setPortrait();

  Adventure game = Adventure();
  runApp(GameWidget(game: kDebugMode ? Adventure() : game));
}

