import 'package:hive/hive.dart';

List items = Hive.box("itemBox").get("items") ?? [];
