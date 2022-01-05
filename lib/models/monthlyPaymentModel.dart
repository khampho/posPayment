// To parse this JSON data, do
//
//     final monthlyPaymentModel = monthlyPaymentModelFromJson(jsonString);

import 'dart:convert';

MonthlyPaymentModel monthlyPaymentModelFromJson(String str) =>
    MonthlyPaymentModel.fromJson(json.decode(str));

String monthlyPaymentModelToJson(MonthlyPaymentModel data) =>
    json.encode(data.toJson());

class MonthlyPaymentModel {
  MonthlyPaymentModel({
    this.id,
    this.name,
    this.zone,
    this.status,
  });

  String id;
  String name;
  String zone;
  int status;

  factory MonthlyPaymentModel.fromJson(Map<String, dynamic> json) =>
      MonthlyPaymentModel(
        id: json["id"],
        name: json["name"],
        zone: json["zone"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "zone": zone,
        "status": status,
      };
}
