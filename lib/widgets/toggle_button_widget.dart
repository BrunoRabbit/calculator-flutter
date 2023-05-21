import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleButtonWidget extends StatefulWidget {
  const ToggleButtonWidget({Key? key}) : super(key: key);

  @override
  State<ToggleButtonWidget> createState() => _ToggleButtonWidgetState();
}

class _ToggleButtonWidgetState extends State<ToggleButtonWidget> {
  int segmentedControlGroupValue = 0;
  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Icon(Icons.wb_sunny_rounded),
    1: Icon(Icons.wb_sunny_outlined)
  };

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: CupertinoSlidingSegmentedControl(
          groupValue: segmentedControlGroupValue,
          children: myTabs,
          onValueChanged: (i) {
            setState(() {
              segmentedControlGroupValue = int.parse(i.toString());
            });
          },
        ),
      ),
    );
  }
}
