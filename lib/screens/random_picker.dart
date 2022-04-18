// import 'dart:ui';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
// import 'package:randomizer_project/constants.dart';
import 'package:randomizer_project/services/getRandomizer.dart';
// import 'package:randomizer_project/services/randomizer.dart';
import 'package:randomizer_project/services/randomizerModel.dart';
// import 'package:randomizer_project/components/mainContainer.dart';

// class RandomPickerScreen extends StatefulWidget {
//   RandomPickerScreen(this.index);
//   final int index;
//   @override
//   _RandomPickerScreenState createState() => _RandomPickerScreenState();
// }

// final TextEditingController eCtrl = new TextEditingController();
// final TextEditingController numCtrl = new TextEditingController();
// List<String> _list = [];
// String _item;
// bool _validate = false;

// class _RandomPickerScreenState extends State<RandomPickerScreen> {
//   Future<ResultModel> _response;
//   @override
//   void initState() {
//     _list = [];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(menu[widget.index]),
//       ),
//       body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: ListView(
//             children: <Widget>[
//               topInputContainer(),
//               SizedBox(height: 5),
//               BuildContainer(
//                 info: _validate == true ? Text("No Item") : buildListView(),
//                 title: "ITEMS",
//               ),
//               SizedBox(height: 20),
//               BuildContainer(
//                 response: _response,
//                 info: buildFutureBuilder(),
//                 title: "RESULTS",
//               ),
//               SizedBox(height: 10),
//               buttonBottomContainer()
//             ],
//           )),
//     );
//   }

//   Container topInputContainer() {
//     return Container(
//       height: kInputHeight,
//       color: Colors.white,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             width: widget.index != 4 ? 357 : 300,
//             child: TextField(
//               controller: eCtrl,
//               onSubmitted: (text) {
//                 if (text == "")
//                   return;
//                 else {
//                   _list.add(text); // Append Text to the list
//                   eCtrl.clear(); // Clear the Text area
//                   setState(() {
//                     _validate = false;
//                   }); // Redraw the Stateful Widget
//                 }
//               },
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'Enter a Item',
//               ),
//             ),
//           ),
//           if (widget.index == 4)
//             Container(
//               width: 50,
//               child: TextField(
//                 controller: numCtrl,
//                 keyboardType: TextInputType.number,
//                 onSubmitted: (text) {},
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: '#',
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   FutureBuilder<ResultModel> buildFutureBuilder() {
//     return FutureBuilder<ResultModel>(
//       future: _response,
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (snapshot.hasData) {
//           String result1 = snapshot.data.result[0];
//           List result = snapshot.data.result;
//           return Container(
//             child: handleRandomizer(
//                 data: widget.index != 1 ? result1 : result,
//                 index: widget.index),
//           );
//         } else {
//           return Container(
//             child: Text(""),
//           );
//         }
//       },
//     );
//   }

//   Container buttonBottomContainer() {
//     return Container(
//       height: 50,
//       child: GestureDetector(
//         onTap: () async {
//           RandomizerAPI randomizer = RandomizerAPI(
//             items: _list,
//             type: widget.index + 1,
//           );
//           setState(() {
//             if (_list.length != 0) {
//               _validate = false;
//               _response = randomizer.getData();
//             } else {
//               _validate = true;
//             }
//           });
//         },
//         child: Container(
//           width: double.infinity,
//           height: kButtonHeightContainer,
//           padding: EdgeInsets.all(10),
//           child: Center(
//             child: Text(
//               'Generate',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//           decoration: BoxDecoration(
//             color: Color(0xFF0A0E31),
//             borderRadius: BorderRadius.circular(18.0),
//           ),
//         ),
//       ),
//     );
//   }

//   ListView buildListView() {
//     return ListView.builder(
//         itemCount: _list.length,
//         itemBuilder: (context, int index) {
//           _item = _list[index];
//           index += 1;
//           return Text(
//             index.toString() + '. $_item',
//             style: kTextHomeStyle,
//           );
//         });
//   }
// }

class RandomPicker {
  final response;
  final type;
  RandomPicker({this.response, this.type});
  // FutureBuilder<ResultModel> buildFutureBuilder() {
  //   return FutureBuilder<ResultModel>(
  //     future: response,
  //     builder: (BuildContext context, AsyncSnapshot snapshot) {
  //       if (snapshot.hasData) {
  //         String result1 = snapshot.data.result[0];
  //         List result = snapshot.data.result;
  //         return Container(
  //           child: handleRandomizer(
  //               data: type != 1 ? result1 : result, index: type),
  //         );
  //       } else {
  //         return Container(
  //           child: Text(""),
  //         );
  //       }
  //     },
  //   );
  Widget buildFutureBuilder() {
    String result1 = response.data.result[0];
    List result = response.data.result;
    return Container(
      child: handleRandomizer(data: "result1"),
    );
  }
}
