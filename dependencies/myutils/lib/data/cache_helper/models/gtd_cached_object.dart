import 'package:hive/hive.dart';

abstract class GtdCachedObject extends HiveObject {
  int get typeId;
  GtdCachedObject();
}
