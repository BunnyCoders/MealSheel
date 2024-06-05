// To parse this JSON data, do
//
//     final productsDataModel = productsDataModelFromJson(jsonString);

import 'dart:convert';

import 'package:meal_sheal/core/models/parent.dart';

ProductsDataModel productsDataModelFromJson(String str) => ProductsDataModel.fromJson(json.decode(str));

String productsDataModelToJson(ProductsDataModel data) => json.encode(data.toJson());

class ProductsDataModel extends Parent{
    final bool? status;
    final List<Datum>? data;
    final String? error;

    ProductsDataModel({
        this.status,
        this.data,
        this.error,
    });

    factory ProductsDataModel.fromJson(Map<String, dynamic> json) => ProductsDataModel(
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
    final String? subDesc;
    final String? description;
    final int? price;
    final String? image;
    final String? favourite;
    final String? status;
    final int? categoryId;
    final DateTime? createdAt;
    final dynamic updatedAt;

    Datum({
        this.id,
        this.name,
        this.subDesc,
        this.description,
        this.price,
        this.image,
        this.favourite,
        this.status,
        this.categoryId,
        this.createdAt,
        this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        subDesc: json["sub_desc"],
        description: json["description"],
        price: json["price"],
        image: json["image"],
        favourite: json["favourite"],
        status: json["status"],
        categoryId: json["category_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sub_desc": subDesc,
        "description": description,
        "price": price,
        "image": image,
        "favourite": favourite,
        "status": status,
        "category_id": categoryId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
    };
}
