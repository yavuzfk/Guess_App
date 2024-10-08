import 'package:flutter/material.dart';
import 'package:guess_app/constants/theme/project_colors.dart';

class QuestionMark extends StatelessWidget {
  const QuestionMark({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.question_mark_outlined,
      size: 64,
      color: ProjectGuessNumberColors.pink,
    );
  }
}
