import 'package:flutter/material.dart';

const Color kPrimaryYellow = Color(0xFFFFBC03);
const Color kPrimaryBlack = Color(0xFF303133);
const Color kPrimaryGrey = Color(0xFFACACAD);
const Color kBackGroudColor = Color(0xFFEDEDED);

ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      caption: base.caption!.copyWith(
        color: kPrimaryYellow,
      ),
      headline6: base.headline6!.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: 'ZenTokoyo',
        fontSize: 28,
        letterSpacing: 2.0,
      ),
      bodyText1: base.bodyText1!.copyWith(
        color: kPrimaryYellow,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: base.bodyText2!.copyWith(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      button: base.button!.copyWith(
        color: kPrimaryYellow,
      ),
      headline1: base.headline1!.copyWith(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'ZenTokoyo',
      ),
      headline2: base.headline2!.copyWith(
        color: Colors.black45,
        fontSize: 18,
        fontFamily: 'ZenTokoyo',
      ),
      headline3: base.headline3!.copyWith(
        color: Colors.black45,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  final ThemeData base = ThemeData();

  return base.copyWith(
    primaryTextTheme: _basicTextTheme(base.textTheme),
    primaryColor: kBackGroudColor,
    indicatorColor: kPrimaryYellow,
    scaffoldBackgroundColor: kBackGroudColor,
    accentColor: kPrimaryYellow,
    accentIconTheme: const IconThemeData(
      color: Colors.black,
      size: 20.0,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 20.0,
    ),
    buttonColor: kPrimaryYellow,
    backgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: kPrimaryYellow,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: kPrimaryYellow,
        backgroundColor: Colors.transparent,
        textStyle: const TextStyle(
          color: kPrimaryYellow,
          fontWeight: FontWeight.bold,
        ),
        side: const BorderSide(
          color: kPrimaryYellow,
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kPrimaryYellow,
      foregroundColor: Colors.white,
    ),
    primaryIconTheme: const IconThemeData(color: Colors.black),
    appBarTheme: const AppBarTheme(
      backgroundColor: kBackGroudColor,
      elevation: 0,
      actionsIconTheme: IconThemeData(color: kPrimaryBlack),
    ),
    hintColor: kPrimaryBlack,
    colorScheme: base.colorScheme.copyWith(
      primary: kPrimaryYellow,
      background: kPrimaryBlack,
    ),
  );
}
