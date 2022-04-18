import 'dart:math';

import 'package:flutter/material.dart';
import 'randomizerItem.dart';
import 'package:randomizer_project/constants.dart';
import 'package:randomizer_project/components/mainContainer.dart';
import 'package:randomizer_project/screens/random_picker.dart';

class RandomizerPicker extends StatelessWidget {
  final type;
  RandomizerPicker(this.type);
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

class RandomizerPickerResult extends StatefulWidget {
  final response;
  final type;
  RandomizerPickerResult({this.response, this.type});
  @override
  _RandomizerPickerResultState createState() => _RandomizerPickerResultState();
}

class _RandomizerPickerResultState extends State<RandomizerPickerResult> {
  @override
  Widget build(BuildContext context) {
    RandomPicker random = RandomPicker();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Expanded(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: Text(
                    "ITEMS",
                    style: kTextTitleStyle,
                  ),
                ),
                Expanded(
                  child: Text(
                    "ITEMS",
                    style: kTextTitleStyle,
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
