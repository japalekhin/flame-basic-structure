import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:shadow_training/shadow-training.dart';

class PunchMarker {
  final ShadowTraining game;
  bool isExpired = false;
  bool isHit = false;
  Rect rect;
  Sprite sprite;

  PunchMarker(this.game, PunchMarkerType type) {
    rect = Rect.fromLTWH(10, -(game.screenHeight - 1.8), 1, 1);
    if (type == PunchMarkerType.left) sprite = Sprite('markers/left.png');
    if (type == PunchMarkerType.right) sprite = Sprite('markers/right.png');
    if (type == PunchMarkerType.up) sprite = Sprite('markers/up.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void update(double t) {
    rect = rect.translate(game.gameSpeed * -t, 0);
    if (rect.left < -2) isExpired = true;
  }
}

enum PunchMarkerType {
  left,
  right,
  up,
}