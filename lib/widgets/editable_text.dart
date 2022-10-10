import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditableText1 extends StatefulWidget {
  bool? edited = false;
  EditableText1({super.key, this.edited});

  @override
  State<EditableText1> createState() => _EditableText1State();
}

class _EditableText1State extends State<EditableText1> {
  @override
  Widget build(BuildContext context) {
    final isEdited = widget.edited;
    switch (isEdited) {
      case true:
        return const TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Item name",
              hintText: "Lamp"),
        );
      default:
        return const Text("data");
    }
  }
}
