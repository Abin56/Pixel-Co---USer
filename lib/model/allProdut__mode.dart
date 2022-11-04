
//     final allProductModel = allProductModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

AllProductModel allProductModelFromJson(String str) =>
    AllProductModel.fromJson(json.decode(str));

String allProductModelToJson(AllProductModel data) =>
    json.encode(data.toJson());

class AllProductModel {
  AllProductModel({
    required this.id,
    required this.productImage,
    required this.productName,
    required this.price,
    required this.category,
    required this.quantity,
    required this.discription,
    required this.documentId,
    required this.available,
  });

  String id;
  String productImage;
  String productName;
  String price;
  String category;
  String quantity;
  String discription;
  String documentId;
  bool available;

  factory AllProductModel.fromJson(Map<String, dynamic> json) =>
      AllProductModel(
        id: json["id"] ?? '',
        productImage: json["ProductImage"] ?? '',
        productName: json["productName"] ?? '',
        price: json["Price"] ?? "",
        category: json["Category"] ?? "",
        quantity: json["quantity"] ?? "",
        discription: json["discription"] ?? "",
        documentId: json["documentID"] ?? "",
        available: json["available"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ProductImage": productImage,
        "productName": productName,
        "Price": price,
        "Category": category,
        "quantity": quantity,
        "discription": discription,
        "documentID": documentId,
        "available": available,
      };
}
