import 'package:flutter/material.dart';
import 'package:guess_app/core/utils/button_styles.dart';
import 'package:guess_app/feature/number_guess/bloc/number_guess_bloc.dart';

class PinkButton extends StatelessWidget {
  const PinkButton({super.key, required this.text, required this.bloc});
  final String text;
  final NumberGuessBloc bloc;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        bloc.add(NumberGuessStartGameEvent());
      },
      style: ButtonStyles.buttonStyle,
      child: Text(text),
    );
  }
}
