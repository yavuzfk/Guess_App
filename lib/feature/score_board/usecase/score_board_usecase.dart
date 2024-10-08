import 'package:guess_app/core/hive/hive_constants.dart';
import 'package:guess_app/core/hive/hive_manager.dart';

class ScoreBoardUsecase {
  static List<int> sortScoreList(List<int> list) {
    list.sort();
    return list;
  }

  static void addNewScore(
      {required List<int> scoreList, required int newScore}) async {
    //En iyi 8 skoru yazdırmak amaçlandı.
    sortScoreList(scoreList);
    if (scoreList.length < 8) {
      scoreList.add(newScore);
    } else {
      int existMaxScore = scoreList.last;
      if (existMaxScore > newScore) {
        scoreList.last = newScore;
      }
    }
    await HiveManager().hiveWrite(HiveGet().hiveDatabaseName, scoreList);
  }
}
