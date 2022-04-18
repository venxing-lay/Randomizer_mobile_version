import 'package:flutter/material.dart';
import 'package:randomizer_project/constants.dart';
import 'package:randomizer_project/screens/randomPicker.dart';
import 'package:randomizer_project/services/randomizerModel.dart';
import 'package:randomizer_project/services/randomizer.dart';
import 'package:randomizer_project/screens/random_picker.dart';

final TextEditingController eCtrl = new TextEditingController();
final TextEditingController numCtrl = new TextEditingController();
List<String> _list = [];
String _item;
var _validate = false;

class RandomizerItem extends StatefulWidget {
  final type;
  RandomizerItem({this.type});
  @override
  _RandomizerItemState createState() => _RandomizerItemState();
}

class _RandomizerItemState extends State<RandomizerItem> {
  Future<ResultModel> _response;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                controller: eCtrl,
                onSubmitted: (text) {
                  if (text == "")
                    return;
                  else {
                    _list.add(text); // Append Text to the list
                    eCtrl.clear(); // Clear the Text area
                    setState(() {
                      _validate = false;
                    }); // Redraw the Stateful Widget
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a Item',
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 20),
      Expanded(
        flex: 10,
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
                    flex: 4,
                    child:
                        _validate == true ? Text("No Item") : buildListView())
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
      SizedBox(height: 20),
      Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: () async {
            RandomizerAPI randomizer = RandomizerAPI(
              items: _list,
              type: widget.type,
            );
            RandomPicker random =
                RandomPicker(response: _response, type: widget.type);
            final route = MaterialPageRoute(
              builder: (context) => RandomizerPickerResult(),
            );
            Navigator.of(context).push(route);

            // setState(() {
            //   if (_list.length != 0) {
            //     _validate = false;
            //     _response = randomizer.getData();
            //   } else {
            //     _validate = true;
            //   }
            // });
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                'Generate',
                style: TextStyle(color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF0A0E31),
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
      ),
    ]);
  }
}

ListView buildListView() {
  return ListView.builder(
      itemCount: _list.length,
      itemBuilder: (context, int index) {
        _item = _list[index];
        index += 1;
        return Text(
          index.toString() + '. $_item',
          style: kTextHomeStyle,
        );
      });
}
