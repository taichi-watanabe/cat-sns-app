import 'package:flutter/material.dart';

class AppColors {
  static const int _primary = 0xff376565;
  static const int _secondary = 0xffF6AD3C;
  static const int _blueGrey = 0xff4C5573;

  static const MaterialColor primary = MaterialColor(
    _primary,
    <int, Color>{
      50: Color(0xffFFEED7),
      100: Color(0xffFFDDAE),
      200: Color(0xffFFCC86),
      300: Color(0xffFFAB40),
      400: Color(0xffFF9100),
      500: Color(0xffFF7942),
      600: Color(0xffFF5F1D),
      700: Color(0xffE65100),
      800: Color(0xffBC4200),
      900: Color(0xff742900),
    },
  );

  static const MaterialColor secondary = MaterialColor(
    _secondary,
    <int, Color>{
      50: Color(0xffF5F5F5),
      100: Color(0xffD9D9D9),
      200: Color(0xffB3B3B3),
      300: Color(0xff8E8E8E),
      400: Color(0xff686868),
      500: Color(0xff424242),
      600: Color(0xff323232),
      700: Color(0xff212121),
      800: Color(0xff1B1B1B),
      900: Color(0xff000000),
    },
  );

  static const MaterialColor blueGrey = MaterialColor(
    _blueGrey,
    <int, Color>{
      50: Color(0xffF7F8FA),
      100: Color(0xffE0E3EB),
      200: Color(0xffC1C7D6),
      300: Color(0xffA2AAC2),
      400: Color(0xff657299),
      500: Color(0xff4C5573),
      600: Color(0xff394056),
      700: Color(0xff2E3447),
      800: Color(0xff191A1E),
      900: Color(0xff000000),
    },
  );

  // text
  static const textLight = Color(0xff686868);
  static const textMiddle = Color(0xff323232);
  static const textDark = Color(0xff1B1B1B);
  static const textWhite = Color(0xffffffff);

  // backGround
  static const backGround = Color(0xffFFFFFF);
  static const backGroundLight = Color(0xffF7F8FA);
  static const backGroundLightMiddle = Color(0xffF4F1EF);
  static const backGroundMiddle = Color(0xffE0E3EB);
  static const backGroundMiddleDark = Color(0xff4C5573);
  static const backGroundDark = Color(0xff191A1E);

  // accent1
  static const accent1Light = Color(0xff72DFD5);
  static const accent1Middle = Color(0xff24C6B7);
  static const accent1Dark = Color(0xff0A8377);

  // accent2
  static const accent2Light = Color(0xffFFAB40);
  static const accent2Middle = Color(0xffFF7942);
  static const accent2Dark = Color(0xffE65100);

  // border
  static const borderLight = Color(0xffF7F8FA);
  static const borderMiddle = Color(0xffE0E3EB);
  static const borderDark = Color(0xffA2AAC2);

  // iconGrey
  static const iconGreyLight = Color(0xffF7F8FA);
  static const iconGreyMiddle = Color(0xffE0E3EB);
  static const iconGreyDark = Color(0xffC1C7D6);

  // iconOrange
  static const iconOrangeLight = Color(0xffFFEED7);
  static const iconOrangeMiddle = Color(0xffFFCC86);
  static const iconOrangeDark = Color(0xffFFAB40);

  // buttonPrimary
  static const buttonPrimary = Color(0xffFF5F1D);
  static const buttonPrimaryDisable = Color(0x30FF5F1D);

  // buttonSecondary
  static const buttonSecondary = Color(0xff424242);
  static const buttonSecondaryDisable = Color(0x30424242);

  // error
  static const error = Color(0xffF04438);

  // textLink
  static const textLink = Color(0xff2E3447);
}

class AppColorsUpdate {
  // Brands color
  static const base = Color(0xff091A2A);
  static const accent = Color(0xffFF5F1D);

  // State color
  static const blue = Color(0xff5CAAF2);
  static const red = Color(0xffFB3945);
  static const orange = Color(0xffFF5F1D);
  static const yellow = Color(0xffFFAE11);
  static const gray = Color(0xff6C6C6C);

  // State Base color
  static const baseBlue = Color(0xffF3FAFE);
  static const baseRed = Color(0xffFFF9F9);
  static const baseOrange = Color(0xffFFF8EB);
  static const baseYellow = Color(0xffFFF9E6);
  static const baseGray = Color(0xffF6F6F6);

  // Black color
  static const black01 = Color(0xff1B1B1B);
  static const black02 = Color(0xff252525);
  static const black03 = Color(0xff353535);
  static const white = Color(0xffFFFFFF);

  // Gray color
  static const gray01 = Color(0xff555555);
  static const gray02 = Color(0xff8A8A8A);
  static const gray03 = Color(0xffA6A6A6);
  static const gray04 = Color(0xffCACCCE);
  static const gray05 = Color(0xffE9EAEC);
  static const gray06 = Color(0xffF2F4F6);
}
