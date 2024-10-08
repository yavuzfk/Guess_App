import 'package:flutter/material.dart';
import 'package:guess_app/constants/theme/project_colors.dart';

class NumberGuessConstants {
  static const String playButtonText = "OYNA";
  static const String playStateUserMessage = "Sayı Tahmin Oyunu";
}

class NumberGuessStyles {
  InputDecoration textFieldDecoration = InputDecoration(
    hintText: 'Tahminini Yaz',
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: const BorderSide(
        color: ProjectGuessNumberColors.pink,
        width: 2.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: const BorderSide(
        color: ProjectGuessNumberColors.pink,
        width: 2.0,
      ),
    ),
  );
}
