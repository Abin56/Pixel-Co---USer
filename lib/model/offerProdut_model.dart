//     final OfferProductModel = OfferProductModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

OfferProductModel OfferProductModelFromJson(String str) =>
    OfferProductModel.fromJson(json.decode(str));

String OfferProductModelToJson(OfferProductModel data) =>
    json.encode(data.toJson());

class OfferProductModel {
  OfferProductModel({
    required this.id,
    required this.productImage,
    required this.productName,
    required this.price,
    required this.offerPercentage,
    required this.quantity,
    required this.discription,
    required this.documentId,
    required this.available,
  });

  String id;
  String productImage;
  String productName;
  String price;
  String offerPercentage;
  String quantity;
  String discription;
  String documentId;
  bool available;

  factory OfferProductModel.fromJson(Map<String, dynamic> json) =>
      OfferProductModel(
        id: json["id"] ?? '',
        productImage: json["ProductImage"] ?? '',
        productName: json["productName"] ?? '',
        price: json["Price"] ?? "",
        offerPercentage: json["OfferPrice"] ?? "",
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
        "OfferPrice": offerPercentage,
        "quantity": quantity,
        "discription": discription,
        "documentID": documentId,
        "available": available,
      };
}
