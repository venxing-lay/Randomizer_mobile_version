import 'package:flutter/material.dart';
import 'randomizerItem.dart';
import 'package:randomizer_project/constants.dart';

class DecisionMaker extends StatelessWidget {
  final type;
  DecisionMaker(this.type);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menu[0]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RandomizerItem(type: type),
      ),
    );
  }
}
