import 'package:flutter/material.dart';
import 'package:inventory/models/items.dart';
import '../utils/item_list.dart';

// ignore: must_be_immutable
class ItemWidget extends StatefulWidget {
  final bool isLabel;
  Item? itemInstance;
  ItemWidget({
    super.key,
    this.itemInstance,
    this.isLabel = false,
  });

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    final index = widget.itemInstance;
    final bool label = widget.isLabel;

    switch (label) {
      case true:
        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Item",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "       Model",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Quantity",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "Price",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        );
      default:
        return Dismissible(
          onDismissed: (direction) {
            items.remove(index);
          },
          key: ObjectKey(widget.itemInstance),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(index!.name),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(index.model)],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text(index.quantity.toString())],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text(index.price)],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text(index.description)],
                ),
              ],
            ),
          ),
        );
    }
  }
}
