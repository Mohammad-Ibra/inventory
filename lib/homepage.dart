import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:inventory/models/items.dart';
import 'package:inventory/utils/item_list.dart';
import 'package:inventory/widgets/item_widget.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});
  int itemId = 0;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Inventory",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              Text(
                "Abboud Electricity",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ],
          ),
          const Gap(20),
          Container(
            width: 200,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey,
            ),
            child: TextButton(
              onPressed: () {
                setState(() {
                  Hive.box("itemBox").putAll({'items': items});
                });
              },
              child: const Icon(
                Icons.save,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey,
            ),
            child: TextButton(
              onPressed: () {
                setState(() {
                  items.add(Item(
                      id: widget.itemId,
                      name: 'item name',
                      model: 'model',
                      quantity: '0',
                      price: 'in \$',
                      description: 'description'));
                  widget.itemId++;
                });
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          ItemWidget(
            isLabel: true,
          ),
          Column(
            children: List.generate(
                items.length,
                (index) => ItemWidget(
                      itemInstance: items[index],
                    )),
          )
        ],
      ),
    );
  }
}
