// To parse this JSON data, do
//
//     final incomeHistory = incomeHistoryFromJson(jsonString);

import 'dart:convert';

IncomeHistory incomeHistoryFromJson(String str) => IncomeHistory.fromJson(json.decode(str));

String incomeHistoryToJson(IncomeHistory data) => json.encode(data.toJson());

class IncomeHistory {
  IncomeHistory({
    this.status,
    this.id,
    this.amount,
    this.note,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String status;
  String id;
  int amount;
  String note;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory IncomeHistory.fromJson(Map<String, dynamic> json) => IncomeHistory(
    status: json["status"],
    id: json["_id"],
    amount: json["amount"],
    note: json["note"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "_id": id,
    "amount": amount,
    "note": note,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "__v": v,
  };
}
