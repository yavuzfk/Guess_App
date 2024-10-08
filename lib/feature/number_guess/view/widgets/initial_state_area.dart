import 'package:flutter/material.dart';
import 'package:guess_app/feature/number_guess/bloc/number_guess_bloc.dart';
import 'package:guess_app/feature/number_guess/constants/number_guess_constants.dart';
import 'package:guess_app/feature/number_guess/view/widgets/pink_button.dart';
import 'package:guess_app/feature/number_guess/view/widgets/question_mark.dart';

class InitialStateArea extends StatelessWidget {
  const InitialStateArea({super.key, required this.bloc});
  final NumberGuessBloc bloc;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const QuestionMark(),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: InitialStateAreaSizes.verticalPadding),
              child: Text(
                NumberGuessConstants.playStateUserMessage,
                style: TextStyle(fontSize: InitialStateAreaSizes.fontSize),
              ),
            ),
            PinkButton(text: NumberGuessConstants.playButtonText, bloc: bloc),
          ],
        ),
      ),
    );
  }
}

class InitialStateAreaSizes {
  static double fontSize = 24;
  static double verticalPadding = 144;
}
