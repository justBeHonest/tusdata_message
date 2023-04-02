import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DecorationConstants {
  static DecorationConstants instance = DecorationConstants._init();
  DecorationConstants._init();
  final backGroundDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        white,
        Color(0xffF7F8FB),
        Color(0xffF5F6FA),
        Color(0xffD5D7DE),
      ],
      stops: [
        0,
        0.40,
        0.50,
        1,
      ],
    ),
  );
}
