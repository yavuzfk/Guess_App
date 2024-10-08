part of 'number_guess_bloc.dart';

sealed class NumberGuessEvent extends Equatable {
  const NumberGuessEvent();

  @override
  List<Object> get props => [];
}

final class NumberGuessInitialEvent extends NumberGuessEvent {}

final class NumberGuessStartGameEvent extends NumberGuessEvent {}

final class NumberGuessFinishGameEvent extends NumberGuessEvent {}

final class NumberGuessUserPredictionEvent extends NumberGuessEvent {
  final int guessNumber;
  const NumberGuessUserPredictionEvent({required this.guessNumber});

  @override
  List<Object> get props => [guessNumber];
}

final class NumberGuessWrongValueEnteredEvent extends NumberGuessEvent {
  final int triggerState;
  @override
  List<Object> get props => [triggerState];
  const NumberGuessWrongValueEnteredEvent({required this.triggerState});
}
