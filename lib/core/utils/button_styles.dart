import 'package:flutter/material.dart';
import 'package:guess_app/constants/theme/project_colors.dart';

class ButtonStyles {
  static final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: ProjectGuessNumberColors.pink,
    foregroundColor: ProjectGuessNumberColors.white,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))),
  ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0));
}
