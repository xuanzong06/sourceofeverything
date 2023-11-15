import 'package:flutter/material.dart';
import 'dart:math';

Color getRandomColor() {
  // 生成隨機的 RGB 顏色
  Random random = Random();
  int red = random.nextInt(256);
  int green = random.nextInt(256);
  int blue = random.nextInt(256);

  return Color.fromRGBO(red, green, blue, 1.0);
}