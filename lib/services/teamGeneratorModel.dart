// To parse this JSON data, do
//
//     final teamGeneratorModel = teamGeneratorModelFromJson(jsonString);

import 'dart:convert';

TeamGeneratorModel teamGeneratorModelFromJson(String str) =>
    TeamGeneratorModel.fromJson(json.decode(str));

String teamGeneratorModelToJson(TeamGeneratorModel data) =>
    json.encode(data.toJson());

class TeamGeneratorModel {
  TeamGeneratorModel({
    this.result,
  });

  List<List<String>> result;

  factory TeamGeneratorModel.fromJson(Map<String, dynamic> json) =>
      TeamGeneratorModel(
        result: List<List<String>>.from(
            json["result"].map((x) => List<String>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(
            result.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
