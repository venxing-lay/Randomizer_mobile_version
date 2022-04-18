import 'package:randomizer_project/constants.dart';
import 'package:flutter/material.dart';

Column randomPicker(data) {
  return Column(
    children: [
      Text(
        data,
        style: kTextResultStyle,
      )
    ],
  );
}

Widget teamGenerator(List<dynamic> _newList) {
  return ListView.builder(
    // Let the ListView know how many items it needs to build.
    itemCount: _newList.length,
    itemExtent: 80,
    // Provide a builder function. This is where the magic happens.
    // Convert each item into a widget based on the type of item it is.
    itemBuilder: (context, index) {
      final item = _newList[index];
      int num = index + 1;
      return ListTile(
          title: Center(child: Text("Team $num")),
          subtitle: Column(
            children: [for (var i in item) Text(i)],
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0));
    },
  );
}

// ListView.builder(
//               itemCount: item.length,
//               itemBuilder: (context, i) {
//                 final team = item[i];
//                 return Text(team);
//               }),
