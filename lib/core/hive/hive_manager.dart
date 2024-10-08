import 'package:guess_app/core/hive/hive_constants.dart';

class HiveManager {
  Future<void> hiveWrite(String key, List<int> value) async {
    if (HiveGet().box.containsKey(key)) {
      await HiveGet().box.delete(key);
    } // because hive does not have a update feature. So we have to delete and put again.
    await HiveGet().box.put(key, value);
  }

  List<int> hiveRead(String key) {
    if (HiveGet().box.containsKey(key)) {
      // IF value is exists true
      var value = HiveGet().box.get(key);
      return value;
    } else {
      return <int>[];
    }
  }

  bool hiveHasData(String key) {
    return HiveGet().box.containsKey(key);
  }

  Future<void> hiveDelete(String key) async {
    if (HiveGet().box.containsKey(key)) HiveGet().box.delete(key);
  }
}
