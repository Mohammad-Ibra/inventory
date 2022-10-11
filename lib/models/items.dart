import 'package:hive/hive.dart';

part 'items.g.dart';

class Store {
  final String? id;
  final String? name;
  final List<Item> items = [];

  Store({required this.id, required this.name, items});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonStore = <String, dynamic>{};
    jsonStore['id'] = id;
    jsonStore['name'] = name;
    jsonStore['items'] = items;
    return jsonStore;
  }
}

@HiveType(typeId: 0)
class Item {
  @HiveField(0)
  final int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String model;
  @HiveField(3)
  String quantity;
  @HiveField(4)
  String price;
  @HiveField(5)
  String description;

  Item(
      {required this.id,
      required this.name,
      required this.model,
      required this.quantity,
      required this.price,
      required this.description});

  int? getId() {
    return id;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> item = <String, dynamic>{};
    item['id'] = id;
    item['name'] = name;
    item['model'] = model;
    item['quantity'] = quantity;
    item['price'] = price;
    item['description'] = description;
    return item;
  }
}
