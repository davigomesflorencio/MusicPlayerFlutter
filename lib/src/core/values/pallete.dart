import 'package:flutter/material.dart';

class Pallete {
  static const primary = 0xFFbff8f00;
  static const background = Color(0xFF0d0d0d);
  static const backgroundDetails = Color(0xFFff8f00);
  static const backgroundDetailsDark = Color(0xFFc56000);
  static const sliverBackground = Color(0xFFfafafc);
  static const menu1Color = Color(0xFFf9d263);
  static const menu2Color = Color(0xFFf2603d);
  static const menu3Color = Color(0xFF04abe6);
  static const tabVarViewColor = Color(0xFFfdfdfd);
  static const starColor = Color(0xFFfdc746);
  static const subTitleText = Color(0xFFc5c4ca);
  static const loveColor = Color(0xFF00ace6);
  static const audioBluishBackground = Color(0xFfdee7fa);
  static const audioBlueBackground = Color(0xFF04abe7);
  static const audioGreyBackground = Color(0xFFf2f2f2);
  static const bt = Color(0XFFc2c2c2);

  static const MaterialColor materialColor = MaterialColor(
    primary, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffce5641), //10%
      100: Color(0xffb74c3a), //20%
      200: Color(0xffa04332), //30%
      300: Color(0xff89392b), //40%
      400: Color(0xff733024), //50%
      500: Color(0xff5c261d), //60%
      600: Color(0xff451c16), //70%
      700: Color(0xff2e130e), //80%
      800: Color(0xff170907), //90%
      900: Color(0xff000000), //100%
    },
  );
}
