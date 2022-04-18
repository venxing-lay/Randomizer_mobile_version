import 'package:randomizer_project/components/randomPicker.dart';
import 'package:randomizer_project/components/customList.dart';
import 'package:flutter/material.dart';

//

Widget handleRandomizer({data, index}) {
  var result;
  switch (index) {
    case 0:
      result = randomPicker(data);
      break;
    case 1:
      var _newList = data.toList()..shuffle();
      result = customList(_newList);
      break;
    case 2:
      result = randomPicker(data);
      break;
    case 3:
      result = randomPicker(data);
      break;
    case 4:
      result = teamGenerator(data);
      break;
    case 5:
      result = randomPicker(data);
      break;
  }
  return result;
}

// void handleRandomizer(index, list) {
//   switch (index) {
//     case 0:
//       result = randomPicker();
//       break;
//     case 1:
//       var _newList = list.toList()..shuffle();
//       int i = 0;
//       result = customList(_newList);
//       break;
//     case 2:
//       result = randomPicker();
//       break;
//     case 3:
//       result = randomPicker();
//       break;
//     case 4:
//       result = Column(
//         children: [
//           Text(
//             "Hello case 4",
//           )
//         ],
//       );
//       break;
//     case 5:
//       result = Column(
//         children: [
//           Text(
//             "Hello case 5",
//           )
//         ],
//       );
//       break;
//   }
// }
