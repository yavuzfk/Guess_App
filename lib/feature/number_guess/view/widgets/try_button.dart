import 'package:flutter/material.dart';
import 'package:guess_app/core/utils/button_styles.dart';
import 'package:guess_app/feature/number_guess/bloc/number_guess_bloc.dart';
import 'package:guess_app/feature/number_guess/usecase/number_guess_usecase.dart';

class TryButton extends StatelessWidget {
  const TryButton({super.key, required this.textFieldText, required this.bloc});
  final String textFieldText;
  final NumberGuessBloc bloc;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (textFieldText.isEmpty) {
            //Normalde kontrolün burada yapılması best practice değil ama basit bir proje olduğu için dallandırmak istemedim.
            bloc.add(NumberGuessWrongValueEnteredEvent(
                triggerState: NumberGuessUsecase.generateRandomNumber()));
          } else {
            bloc.add(NumberGuessUserPredictionEvent(
                guessNumber: int.parse(textFieldText)));
          }
        },
        style: ButtonStyles.buttonStyle,
        child: const Text("Dene"));
  }
}
