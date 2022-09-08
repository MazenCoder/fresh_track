import 'package:hive/hive.dart';
import 'keys.dart';

class Boxes {
  static Box<dynamic> boxSettings() => Hive.box<dynamic>(Keys.settings);
  static Box<dynamic> boxLoginInfo() => Hive.box<dynamic>(Keys.boxLoginInfo);
}
