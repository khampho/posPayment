// To parse this JSON data, do
//
//     final dailyIncomeModel = dailyIncomeModelFromJson(jsonString);

import 'dart:convert';

DailyIncomeModel dailyIncomeModelFromJson(String str) =>
    DailyIncomeModel.fromJson(json.decode(str));

String dailyIncomeModelToJson(DailyIncomeModel data) =>
    json.encode(data.toJson());

class DailyIncomeModel {
  DailyIncomeModel({
    this.totalPrice,
    this.data,
  });

  int totalPrice;
  List<Datum> data;

  factory DailyIncomeModel.fromJson(Map<String, dynamic> json) =>
      DailyIncomeModel(
        totalPrice: json["total_price"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_price": totalPrice,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.billNo,
    this.time,
    this.price,
  });

  String billNo;
  String time;
  int price;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        billNo: json["bill_no"],
        time: json["time"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "bill_no": billNo,
        "time": time,
        "price": price,
      };
}
