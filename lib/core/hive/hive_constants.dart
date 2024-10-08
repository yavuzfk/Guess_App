import 'package:hive/hive.dart';

class HiveGet {
  final String hiveDatabaseName = 'hiveBox';

  late final Box box = Hive.box(hiveDatabaseName);
}
