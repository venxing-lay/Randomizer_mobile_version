import 'package:flutter/material.dart';
import 'package:randomizer_project/constants.dart';

Column customList(List<String> _newList) {
  int i = 0;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: _newList.map((value) {
      i++;
      return Text(
        "$i. " + value,
        style: kTextHomeStyle,
      );
    }).toList(),
  );
}
