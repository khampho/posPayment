// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    this.date,
    this.billNo,
    this.totalPrice,
    this.datas,
  });

  String date;
  String billNo;
  String totalPrice;
  List<Data> datas;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        date: json["date"],
        billNo: json["bill_no"],
        totalPrice: json["total_price"],
        datas: List<Data>.from(json["datas"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "bill_no": billNo,
        "total_price": totalPrice,
        "datas": List<dynamic>.from(datas.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    this.list,
    this.price,
  });

  String list;
  int price;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "list": list,
        "price": price,
      };
}
