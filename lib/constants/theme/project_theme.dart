import 'package:flutter/material.dart';
import 'package:guess_app/constants/theme/project_colors.dart';

class ProjectThemes {
  static final lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "LatoLight",
      scaffoldBackgroundColor: ProjectMainColors.white,
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white, // Başlık rengini beyaz yap
            fontSize: 20, // Font boyutu
            fontWeight: FontWeight.bold, // Font kalınlığı
          ),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: ProjectGuessNumberColors.pink),
      colorScheme: ColorScheme.light(
        primary: Colors.blueGrey.shade800,
        secondary: const Color.fromARGB(255, 23, 20, 173),
      ),
      iconTheme: const IconThemeData(color: Colors.black));
}
