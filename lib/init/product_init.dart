import 'package:guess_app/core/extensions/exception_extension.dart';
import 'package:guess_app/core/hive/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

final class ProductInit {
  static Future<String> init() async {
    try {
      await Hive.initFlutter();
      await Hive.openBox(HiveGet().hiveDatabaseName);
    } on Exception catch (exception) {
      return exception.getMessage;
    }
    return "";
  }
}
