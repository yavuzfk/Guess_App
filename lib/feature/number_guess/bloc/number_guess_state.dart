part of 'number_guess_bloc.dart';

sealed class NumberGuessState extends Equatable {
  const NumberGuessState();

  @override
  List<Object> get props => [];
}

sealed class NumberGuessActionState extends NumberGuessState {
  const NumberGuessActionState();
}

final class NumberGuessInitialState extends NumberGuessState {}

final class NumberGuessStartGameState extends NumberGuessState {}

final class NumberGuessUserPredictionState extends NumberGuessState {
  final String message;
  final int predictionSize;

  @override
  List<Object> get props => [message, predictionSize];
  const NumberGuessUserPredictionState(
      {required this.message, required this.predictionSize});
}

final class NumberGuessFinishGameState extends NumberGuessActionState {
  final int predictionSize;
  @override
  List<Object> get props => [predictionSize];
  const NumberGuessFinishGameState({required this.predictionSize});
}

final class NumberGuessWrongValueState extends NumberGuessActionState {
  final String errorMessage;
  final int triggerState;
  @override
  List<Object> get props => [triggerState, errorMessage];
  const NumberGuessWrongValueState(
      {required this.triggerState, required this.errorMessage});
}
