import 'package:flutter/material.dart';

ThemeData theme(){
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme(
        primary: Color(0xff7A4FFC),
        secondary: Color(0xff04CE7D),
        background: Color(0xffFFFFFF),
        surface: Color(0xffFFFFFF),
        error: Color(0xffFF8955),
        brightness: Brightness.light,
        onPrimary: Color(0xff7A4FFC),
        onSecondary: Color(0xff7A4FFC),
        onError: Color(0xff7A4FFC),
        onSurface: Color(0xff7A4FFC),
        onBackground: Color(0xffffffff),
      ),
      fontFamily: 'Futura',
      textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.normal,
            fontSize: 36,
          ),
          displayMedium: TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.normal,
            fontSize: 24,
          ),
          displaySmall: TextStyle(
            color: Color(0xff000000),
            fontWeight:FontWeight.normal,
            fontSize: 16,
          )
      )
  );
}
