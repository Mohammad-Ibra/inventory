import 'package:flutter/material.dart';
import 'package:inventory/models/items.dart';
import 'package:inventory/widgets/swap_widget.dart';
import '../utils/item_list.dart';

// ignore: must_be_immutable
class ItemWidget extends StatefulWidget {
  final bool isLabel;
  Item? itemInstance;
  final nameController = TextEditingController();
  final modelController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  ItemWidget({
    super.key,
    this.itemInstance,
    this.isLabel = false,
  });

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  bool isSelected = false;
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
              Container(
                width: 200,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Text(
                  "Item",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 200,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Center(
                  child: Text(
                    "Model",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 200,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Center(
                  child: Text(
                    "Quantity",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 200,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Center(
                  child: Text(
                    "Price",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 200,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Center(
                  child: Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Icon(
                Icons.abc,
                color: Colors.white,
              )
            ],
          ),
        );
      default:
        return Dismissible(
          onDismissed: (direction) {
            items.remove(index);
          },
          key: ObjectKey(index),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 200,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: MySwapWidget(
                    childIfSelected: SizedBox(
                      width: 200,
                      height: 10,
                      child: TextField(
                        controller: widget.nameController,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    childIfnotSelected: Text(index!.name),
                    selected: isSelected,
                  ),
                ),
                Container(
                  width: 200,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: MySwapWidget(
                      childIfSelected: SizedBox(
                        width: 200,
                        height: 10,
                        child: TextField(
                          controller: widget.modelController,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      childIfnotSelected: Text(index.model),
                      selected: isSelected,
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: MySwapWidget(
                      childIfSelected: SizedBox(
                        width: 200,
                        height: 10,
                        child: TextField(
                          controller: widget.quantityController,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      childIfnotSelected: Text(index.quantity),
                      selected: isSelected,
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: MySwapWidget(
                      childIfSelected: SizedBox(
                        width: 200,
                        height: 10,
                        child: TextField(
                          controller: widget.priceController,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      childIfnotSelected: Text(index.price),
                      selected: isSelected,
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: MySwapWidget(
                      childIfSelected: SizedBox(
                        width: 200,
                        height: 10,
                        child: TextField(
                          controller: widget.descriptionController,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      childIfnotSelected: Text(index.description),
                      selected: isSelected,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onDoubleTap: () {
                        setState(() {
                          isSelected = !isSelected;
                          index.name = widget.nameController.text;
                          index.model = widget.modelController.text;
                          index.quantity = widget.quantityController.text;
                          index.price = widget.priceController.text;
                          index.description = widget.descriptionController.text;
                        });
                      },
                      child: MySwapWidget(
                        childIfSelected:
                            const Icon(Icons.edit_attributes_rounded),
                        childIfnotSelected: const Icon(Icons.edit),
                        selected: isSelected,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
    }
  }
}
