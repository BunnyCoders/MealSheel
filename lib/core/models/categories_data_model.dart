import 'dart:convert';

import 'package:meal_sheal/core/models/parent.dart';

CategoriesDataModel categoriesDataModelFromJson(String str) =>
    CategoriesDataModel.fromJson(json.decode(str));

String categoriesDataModelToJson(CategoriesDataModel data) =>
    json.encode(data.toJson());

class CategoriesDataModel extends Parent{
  final bool? status;
   final List<Datum>? data;
  final String? error;

  CategoriesDataModel({
    this.status,
    this.data,
    this.error,
  });

  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) =>
      CategoriesDataModel(
         status: json["status"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "error": error,
      };
}

class Datum {
  final int? id;
  final String? name;
  final String? image;
  final String? status;
  final DateTime? createdAt;
  final dynamic updatedAt;

  Datum({
    this.id,
    this.name,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
      };
}
