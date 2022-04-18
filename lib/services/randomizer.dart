import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:randomizer_project/services/randomizerModel.dart';
import 'package:randomizer_project/services/teamGeneratorModel.dart';

class RandomizerAPI {
  final items;
  final int type;
  var url = Uri.parse('http://calsmaitmei-app.test/api/randomizer/generate');
  var resultModel;
  RandomizerAPI({this.items, this.type});

  Future<ResultModel> getData() async {
    final Map<String, dynamic> data = {
      "data": {"items": items},
      "type": type,
    };
    try {
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(data),
      );
      if (response.statusCode == 200) {
        var responseString = response.body;
        var responseMap = json.decode(responseString);

        resultModel = ResultModel.fromJson(responseMap);
      } else
        return null;

      return resultModel;
    } catch (e) {
      print(e);
    }
  }

  Future<TeamGeneratorModel> getDataTeamGenerator() async {
    int qty = 2;
    final Map<String, dynamic> data = {
      "data": {"items": items, "qty": qty},
      "type": type,
    };
    try {
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(data),
      );
      if (response.statusCode == 200) {
        var responseString = response.body;
        var responseMap = json.decode(responseString);
        print(responseMap);
        resultModel = TeamGeneratorModel.fromJson(responseMap);
      } else
        return null;
      return resultModel;
    } catch (e) {
      print(e);
    }
  }
}
