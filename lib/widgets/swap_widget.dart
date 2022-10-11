/* 

MySwapWidget(
  selected: (default value, could be useful, false by default) true / false,
  childIfSelected: TextField(),
  childIfNotSelected: Text(),
)

*/

import 'package:flutter/src/widgets/framework.dart';

class MySwapWidget extends StatefulWidget {
  final bool selected;
  final Widget childIfSelected;
  final Widget childIfnotSelected;

  const MySwapWidget(
      {super.key,
      required this.childIfSelected,
      required this.childIfnotSelected,
      this.selected = false});

  @override
  State<MySwapWidget> createState() => _MySwapWidgetState();
}

class _MySwapWidgetState extends State<MySwapWidget> {
  @override
  Widget build(BuildContext context) {
    switch (widget.selected) {
      case true:
        return widget.childIfSelected;
      default:
        return widget.childIfnotSelected;
    }
  }
}
