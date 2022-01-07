// To parse this JSON data, do
//
//     final paidStoreModel = paidStoreModelFromJson(jsonString);

import 'dart:convert';

PaidStoreModel paidStoreModelFromJson(String str) => PaidStoreModel.fromJson(json.decode(str));

String paidStoreModelToJson(PaidStoreModel data) => json.encode(data.toJson());

class PaidStoreModel {
  PaidStoreModel({
    this.id,
    this.name,
    this.date,
    this.zone,
    this.price,
  });

  int id;
  String name;
  String date;
  String zone;
  int price;

  factory PaidStoreModel.fromJson(Map<String, dynamic> json) => PaidStoreModel(
    id: json["id"],
    name: json["name"],
    date: json["date"],
    zone: json["zone"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "date": date,
    "zone": zone,
    "price": price,
  };
}
