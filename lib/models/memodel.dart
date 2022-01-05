// To parse this JSON data, do
//
//     final memodel = memodelFromJson(jsonString);

import 'dart:convert';

Memodel memodelFromJson(String str) => Memodel.fromJson(json.decode(str));

String memodelToJson(Memodel data) => json.encode(data.toJson());

class Memodel {
  Memodel({
    this.deposit,
    this.deletedAt,
    this.id,
    this.code,
    this.gender,
    this.firstName,
    this.lastName,
    this.mobile,
    this.note,
    this.address,
    this.email,
    this.marketId,
    this.vehicleTypeId,
    this.roleId,
    this.lastLogin,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  int deposit;
  dynamic deletedAt;
  String id;
  String code;
  String gender;
  String firstName;
  String lastName;
  String mobile;
  String note;
  String address;
  String email;
  MarketId marketId;
  EId vehicleTypeId;
  EId roleId;
  DateTime lastLogin;
  int v;
  DateTime createdAt;
  DateTime updatedAt;

  factory Memodel.fromJson(Map<String, dynamic> json) => Memodel(
        deposit: json["deposit"],
        deletedAt: json["deleted_at"],
        id: json["_id"],
        code: json["code"],
        gender: json["gender"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        mobile: json["mobile"],
        note: json["note"],
        address: json["address"],
        email: json["email"],
        marketId: MarketId.fromJson(json["market_id"]),
        vehicleTypeId: EId.fromJson(json["vehicle_type_id"]),
        roleId: EId.fromJson(json["role_id"]),
        lastLogin: DateTime.parse(json["last_login"]),
        v: json["__v"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "deposit": deposit,
        "deleted_at": deletedAt,
        "_id": id,
        "code": code,
        "gender": gender,
        "first_name": firstName,
        "last_name": lastName,
        "mobile": mobile,
        "note": note,
        "address": address,
        "email": email,
        "market_id": marketId.toJson(),
        "vehicle_type_id": vehicleTypeId.toJson(),
        "role_id": roleId.toJson(),
        "last_login": lastLogin.toIso8601String(),
        "__v": v,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class MarketId {
  MarketId({
    this.id,
    this.code,
    this.name,
    this.logo,
    this.telephone,
  });

  String id;
  String code;
  String name;
  String logo;
  String telephone;

  factory MarketId.fromJson(Map<String, dynamic> json) => MarketId(
        id: json["_id"],
        code: json["code"],
        name: json["name"],
        logo: json["logo"],
        telephone: json["telephone"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "code": code,
        "name": name,
        "logo": logo,
        "telephone": telephone,
      };
}

class EId {
  EId({
    this.id,
    this.nameEn,
    this.nameLa,
    this.role,
  });

  String id;
  String nameEn;
  String nameLa;
  int role;

  factory EId.fromJson(Map<String, dynamic> json) => EId(
        id: json["_id"],
        nameEn: json["name_en"],
        nameLa: json["name_la"],
        role: json["role"] == null ? null : json["role"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name_en": nameEn,
        "name_la": nameLa,
        "role": role == null ? null : role,
      };
}
