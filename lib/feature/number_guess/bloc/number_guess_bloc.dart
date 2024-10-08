import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guess_app/core/hive/hive_constants.dart';
import 'package:guess_app/core/hive/hive_manager.dart';
import 'package:guess_app/feature/number_guess/usecase/number_guess_usecase.dart';
import 'package:guess_app/feature/score_board/usecase/score_board_usecase.dart';

part 'number_guess_event.dart';
part 'number_guess_state.dart';

class NumberGuessBloc extends Bloc<NumberGuessEvent, NumberGuessState> {
  NumberGuessBloc() : super(NumberGuessInitialState()) {
    on<NumberGuessInitialEvent>(initialEvent);
    on<NumberGuessStartGameEvent>(startGameEvent);
    on<NumberGuessFinishGameEvent>(finishGameEvent);
    on<NumberGuessUserPredictionEvent>(userPredictionEvent);
    on<NumberGuessWrongValueEnteredEvent>(wrongValueEnteredEvent);
  }
  //Bloc seviyesindeki değişkenleri burada tanımlıyorum, sadece oluşacak stateler arası kullanım için
  int _randomNumberBloc = -1;
  int _predictionSize = 0;
  List<int> scoreList = HiveManager().hiveRead(HiveGet().hiveDatabaseName);

  FutureOr<void> initialEvent(
      NumberGuessInitialEvent event, Emitter<NumberGuessState> emit) {}

  FutureOr<void> startGameEvent(
      NumberGuessStartGameEvent event, Emitter<NumberGuessState> emit) {
    _randomNumberBloc = NumberGuessUsecase.generateRandomNumber();
    emit(NumberGuessStartGameState());
  }

  FutureOr<void> finishGameEvent(
      NumberGuessFinishGameEvent event, Emitter<NumberGuessState> emit) {}

  FutureOr<void> userPredictionEvent(
      NumberGuessUserPredictionEvent event, Emitter<NumberGuessState> emit) {
    final int userPredicton = event.guessNumber;

    _predictionSize++;

    if (userPredicton <= 0 || userPredicton > 100) {
      emit(NumberGuessWrongValueState(
          errorMessage: "Sayı 1-100 Aralığında Olmalıdır !!!",
          triggerState: NumberGuessUsecase.generateRandomNumber()));
    } else {
      if (userPredicton == _randomNumberBloc) {
        ScoreBoardUsecase.addNewScore(
            scoreList: scoreList, newScore: _predictionSize);
        emit(NumberGuessFinishGameState(predictionSize: _predictionSize));

        _predictionSize = 0;
        emit(NumberGuessInitialState());
      } else if (userPredicton > _randomNumberBloc) {
        emit(NumberGuessUserPredictionState(
            message: "Daha Küçük Bir Sayı Deneyin",
            predictionSize: _predictionSize));
      } else {
        emit(NumberGuessUserPredictionState(
            message: "Daha Büyük Bir Sayı Deneyin",
            predictionSize: _predictionSize));
      }
    }
  }

  FutureOr<void> wrongValueEnteredEvent(
      NumberGuessWrongValueEnteredEvent event, Emitter<NumberGuessState> emit) {
    emit(NumberGuessWrongValueState(
        errorMessage: "Sayı Girişi Sağlayınız !!!",
        triggerState: NumberGuessUsecase.generateRandomNumber()));
  }
}
