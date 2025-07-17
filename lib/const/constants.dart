import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Const{
  static const Color themeColor = Color(0xffea4c89);
  // static const Color themeColor = Color(0xffff143f);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color buttonColor = Color(0xffea4c89);
  static String shoesDesc = "Step up your everyday fashion game with the Levi’s Men Sneaker Shoes – a perfect fusion of timeless style, all-day comfort, and rugged durability. Crafted for the modern man who values quality and aesthetics, these sneakers are designed to transition seamlessly from casual outings to smart-casual events.Made from premium synthetic leather.S Men day comfort, as quality.";

  static List <Color> mColors = [
    Color(0xffdd111d),
    Color(0xff0c0c0c),
    Color(0xec12e10c),
    Color(0xff013ac9),
    Color(0xffe2d8d7),
    Color(0xffFFFF08),
    // Color(0xffB748EA),
  ];
 static BoxDecoration commonBorderDecoration({double width = 1, Color color = Colors.black}) {
    return BoxDecoration(
      border: Border.all(
        width: width,
        color: color,
      ),
    );
  }
}

