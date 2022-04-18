// To parse this JSON data, do
//
//     final resultModel = resultModelFromJson(jsonString);

import 'dart:convert';

ResultModel resultModelFromJson(String str) =>
    ResultModel.fromJson(json.decode(str));

String resultModelToJson(ResultModel data) => json.encode(data.toJson());

class ResultModel {
  ResultModel({
    this.result,
  });

  List<String> result;

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        result: List<String>.from(json["result"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x)),
      };
}
