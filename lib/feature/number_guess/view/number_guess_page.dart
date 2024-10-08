import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_app/core/utils/button_styles.dart';
import 'package:guess_app/core/widgets/error_message.dart';
import 'package:guess_app/feature/number_guess/bloc/number_guess_bloc.dart';
import 'package:guess_app/feature/number_guess/constants/number_guess_constants.dart';
import 'package:guess_app/feature/number_guess/usecase/number_guess_usecase.dart';
import 'package:guess_app/feature/number_guess/view/widgets/initial_state_area.dart';
import 'package:guess_app/feature/number_guess/view/widgets/question_mark.dart';
import 'package:guess_app/feature/number_guess/view/widgets/success_popup.dart';

class NumberGuessPage extends StatefulWidget {
  const NumberGuessPage({super.key});

  @override
  _NumberGuessPageState createState() => _NumberGuessPageState();
}

class _NumberGuessPageState extends State<NumberGuessPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final NumberGuessBloc bloc = NumberGuessBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocConsumer<NumberGuessBloc, NumberGuessState>(
            bloc: bloc,
            buildWhen: (previous, current) =>
                current is! NumberGuessActionState,
            listenWhen: (previous, current) =>
                current is NumberGuessActionState,
            listener: (context, state) {
              if (state is NumberGuessFinishGameState) {
                showCongratulationsPopup(context, state.predictionSize);
              } else if (state is NumberGuessWrongValueState) {
                bottomMessageError(context, state.errorMessage);
              }
            },
            builder: (context, state) {
              if (state is NumberGuessInitialState) {
                _textEditingController.clear();
                return InitialStateArea(bloc: bloc);
              } else if (state is NumberGuessStartGameState ||
                  state is NumberGuessUserPredictionState) {
                return Container(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const QuestionMark(),
                      Text("Tahmin Et",
                          style: TextStyle(
                              fontSize: InitialStateAreaSizes.fontSize)),
                      TextField(
                        controller: _textEditingController,
                        keyboardType: TextInputType.number,
                        decoration: NumberGuessStyles().textFieldDecoration,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (_textEditingController.text.isEmpty) {
                              //Normalde kontrolün burada yapılması best practice değil ama basit bir proje olduğu için dallandırmak istemedim.
                              bloc.add(NumberGuessWrongValueEnteredEvent(
                                  triggerState: NumberGuessUsecase
                                      .generateRandomNumber()));
                            } else {
                              bloc.add(NumberGuessUserPredictionEvent(
                                  guessNumber:
                                      int.parse(_textEditingController.text)));
                            }
                          },
                          style: ButtonStyles.buttonStyle,
                          child: const Text("Dene")),
                      (state is NumberGuessUserPredictionState)
                          ? Text(state.message)
                          : const SizedBox.shrink(),
                      (state is NumberGuessUserPredictionState)
                          ? Text("Deneme Sayısı: ${state.predictionSize}")
                          : const SizedBox.shrink(),
                    ],
                  ),
                );
              }
              // else if (state is NumberGuessUserPredictionState) {
              //   return Container(
              //     child: Column(
              //       children: [
              //         const QuestionMark(),
              //         Text("Tahmin Et",
              //             style: TextStyle(
              //                 fontSize: InitialStateAreaSizes.fontSize)),
              //         TextField(
              //           controller: _textEditingController,
              //           keyboardType: TextInputType.number,
              //           decoration: NumberGuessStyles().textFieldDecoration,
              //         ),
              //         TryButton(
              //             textFieldText: _textEditingController.text,
              //             bloc: bloc),
              //         Text(state.message),
              //         Text("Deneme Sayısı: ${state.predictionSize}"),
              //       ],
              //     ),
              //   );
              // }
              else {
                return const Center(
                  child: Text("Hata"),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
