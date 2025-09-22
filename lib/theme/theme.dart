// import 'package:flutter/material.dart';

// import 'theme_data/text_theme.dart';

// class AppTheme {
//   AppTheme._();

//   static ThemeData lightTheme = ThemeData(
//     useMaterial3: true,
//     fontFamily: 'Aeonik',
//     brightness: Brightness.light,
//     primaryColor: Colors.grey,
//     scaffoldBackgroundColor: Colors.white,
//     textTheme: TexTheme.customTextTheme,
//   );
// }


import 'package:flutter/material.dart';
import 'theme_data/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        fontFamily: 'Aeonik',
        brightness: Brightness.light,
        primaryColor: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TexTheme.customTextTheme(context), // now responsive
      );
}
