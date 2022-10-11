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

class Item {
  final int id;
  String name;
  String model;
  String quantity;
  String price;
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
