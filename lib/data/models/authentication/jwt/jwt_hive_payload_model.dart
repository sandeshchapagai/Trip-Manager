import 'dart:convert';

import 'package:hive/hive.dart';

final actionValues = EnumValues({"EDIT": Action.edit, "VIEW": Action.view});

JwtHivePayloadModel jwtHivePayloadModelFromJson(String str) =>
    JwtHivePayloadModel.fromJson(json.decode(str));

@HiveType(typeId: 2)
enum Action {
  @HiveField(0)
  edit(value: "EDIT"),
  @HiveField(1)
  view(value: "VIEW");

  final String? value;
  const Action({this.value});
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

@HiveType(typeId: 0)
class JwtHivePayloadModel {
  @HiveField(0)
  String? userId;
  @HiveField(1)
  String? restaurantId;
  @HiveField(2)
  String? role;
  @HiveField(3)
  List<Permission>? permissions;
  @HiveField(4)
  int? iat;
  @HiveField(5)
  int? exp;

  JwtHivePayloadModel({
    this.userId,
    this.restaurantId,
    this.role,
    this.permissions,
    this.iat,
    this.exp,
  });

  factory JwtHivePayloadModel.fromJson(Map<String, dynamic> json) =>
      JwtHivePayloadModel(
        userId: json["userId"],
        role: json["role"],
        permissions: List<Permission>.from(
            json["permissions"]?.map((x) => Permission.fromJson(x)) ?? []),
        iat: json["iat"],
        exp: json["exp"],
      );
}

@HiveType(typeId: 1)
class Permission {
  @HiveField(0)
  String? resource;
  @HiveField(1)
  List<Action>? action;

  Permission({
    this.resource,
    this.action,
  });

  factory Permission.fromJson(Map<String, dynamic> json) => Permission(
        resource: json["resource"],
        action: List<Action>.from(
            json["action"]?.map((x) => actionValues.map[x]) ?? []),
      );
}
