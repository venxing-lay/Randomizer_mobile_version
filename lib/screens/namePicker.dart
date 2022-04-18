import 'package:flutter/material.dart';
import 'randomizerItem.dart';
import 'package:randomizer_project/constants.dart';

class NamePicker extends StatelessWidget {
  final type;
  NamePicker(this.type);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menu[type - 1]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RandomizerItem(type: type),
      ),
    );
  }
}
