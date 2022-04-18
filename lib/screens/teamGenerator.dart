import 'package:flutter/material.dart';
import 'package:randomizer_project/constants.dart';
import 'package:randomizer_project/services/getRandomizer.dart';
import 'package:randomizer_project/services/randomizer.dart';
import 'package:randomizer_project/services/teamGeneratorModel.dart';

class TeamGenerator extends StatefulWidget {
  final type;
  TeamGenerator(this.type);

  @override
  _TeamGeneratorState createState() => _TeamGeneratorState();
}

final TextEditingController eCtrl = new TextEditingController();
final TextEditingController numCtrl = new TextEditingController();
List<String> _list = [];
bool _validate = false;
String _item;

class _TeamGeneratorState extends State<TeamGenerator> {
  Future<TeamGeneratorModel> _responses;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menu[4]),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              topInputContainer(),
              SizedBox(height: 5),
              BuildContainer(
                info: _validate == true ? Text("No Item") : buildListView(),
                title: "ITEMS",
              ),
              SizedBox(height: 20),
              BuildContainer(
                response: _responses,
                info: buildFutureBuilder(),
                title: "RESULTS",
              ),
              SizedBox(height: 10),
              buttonBottomContainer()
            ],
          )),
    );
  }

  Container topInputContainer() {
    return Container(
      height: kInputHeight,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 300,
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
          Container(
            width: 50,
            child: TextField(
              controller: numCtrl,
              keyboardType: TextInputType.number,
              onSubmitted: (text) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '#',
              ),
            ),
          ),
        ],
      ),
    );
  }

  FutureBuilder<TeamGeneratorModel> buildFutureBuilder() {
    return FutureBuilder<TeamGeneratorModel>(
      future: _responses,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data.result);
          List result = snapshot.data.result;
          return Container(
            child: handleRandomizer(data: result, index: 4),
          );
        } else {
          print("fail");
          return Container(
            child: Text(""),
          );
        }
      },
    );
  }

  Container buttonBottomContainer() {
    return Container(
      height: 50,
      child: GestureDetector(
        onTap: () async {
          RandomizerAPI randomizer = RandomizerAPI(
            items: _list,
            type: 5,
          );
          setState(() {
            if (_list.length != 0) {
              _validate = false;
              _responses = randomizer.getDataTeamGenerator();
            } else {
              _validate = true;
            }
          });
        },
        child: Container(
          width: double.infinity,
          height: kButtonHeightContainer,
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
    );
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
}

class BuildContainer extends StatelessWidget {
  const BuildContainer({
    Key key,
    this.response,
    this.info,
    this.title,
  });
  final Future<TeamGeneratorModel> response;
  final String title;
  final Widget info;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kResultHeight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Text(
                title,
                style: kTextTitleStyle,
              ),
            ),
            Expanded(flex: 4, child: info)
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
    );
  }
}
