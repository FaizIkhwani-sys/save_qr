import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    dividerColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.white,
    accentColor: Colors.indigo,
    errorColor: Colors.red,
    accentTextTheme: TextTheme(
      button: TextStyle(
        color: Colors.green,
      ),
    ),
    dialogBackgroundColor: Colors.white,
    primaryColor: Colors.indigo,
    secondaryHeaderColor: Colors.black54,
    primaryIconTheme: IconThemeData(color: Colors.indigo),
    toggleableActiveColor: Colors.indigo,
    unselectedWidgetColor: Colors.black12,
    disabledColor: Colors.grey,
    primarySwatch: Colors.grey,
    primaryTextTheme: TextTheme(headline6: TextStyle(color: Colors.black)),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.white,
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.black,
        ),
        headline2: TextStyle(color: Colors.black54, fontSize: 16),
      ),
      elevation: 0.0,
      color: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black),
      iconTheme: IconThemeData(
        color: Colors.indigo,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.indigo,
      disabledColor: Colors.grey,
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: IconThemeData(
      color: Colors.black45,
    ),
    textTheme: TextTheme(
      button: TextStyle(
        color: Colors.white,
      ),
      headline1: TextStyle(
        color: Colors.black87,
        fontSize: 24.0,
      ),
      headline2: TextStyle(
        color: Colors.black87,
        fontSize: 16.0,
      ),
      headline3: TextStyle(
        color: Colors.black54,
        fontSize: 14.0,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        color: Colors.black87,
      ),
      caption: TextStyle(
        color: Colors.black87,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 38, vertical: 20),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black38),
        gapPadding: 10,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.indigo),
        gapPadding: 10,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black38),
        gapPadding: 10,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    dividerColor: Colors.transparent,
    scaffoldBackgroundColor: Color(0xFF212121),
    accentColor: Colors.blue,
    errorColor: Colors.red,
    accentTextTheme: TextTheme(
      button: TextStyle(
        color: Colors.green,
      ),
    ),
    dialogBackgroundColor: Color(0xFF212121),
    primaryColor: Colors.blue,
    secondaryHeaderColor: Colors.white70,
    primaryIconTheme: IconThemeData(
      color: Colors.blue,
    ),
    toggleableActiveColor: Colors.blue,
    unselectedWidgetColor: Color(0xFFF0F2F5),
    textTheme: TextTheme(
      button: TextStyle(
        color: Colors.white,
      ),
      headline1: TextStyle(
        color: Colors.white,
        fontSize: 24.0,
      ),
      headline2: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
      headline3: TextStyle(
        color: Colors.white,
        fontSize: 14.0,
      ),
      bodyText1: TextStyle(
        color: Colors.white,
      ),
      bodyText2: TextStyle(
        color: Colors.white70,
      ),
      caption: TextStyle(
        color: Colors.white70,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: IconThemeData(
      color: Colors.white54,
    ),
    disabledColor: Colors.white60,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF212121),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.white,
        ),
        headline2: TextStyle(color: Colors.white, fontSize: 16),
      ),
      elevation: 0.0,
      color: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 38, vertical: 20),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white),
        gapPadding: 10,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white60),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.blue,
        ),
        gapPadding: 10,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white),
        gapPadding: 10,
      ),
    ),
  );
}
