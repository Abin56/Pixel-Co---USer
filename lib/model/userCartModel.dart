//     final UserCartProdutModel = UserCartProdutModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pixels_user/view/cart/buying_Items/buying_items.dart';

UserCartProdutModel UserCartProdutModelFromJson(String str) =>
    UserCartProdutModel.fromJson(json.decode(str));

String UserCartProdutModelToJson(UserCartProdutModel data) =>
    json.encode(data.toJson());

class UserCartProdutModel {
  UserCartProdutModel({
    required this.userID,
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
  String userID;
  String productImage;
  String productName;
  double price;
  String category;
  int quantity;
  String discription;
  String documentId;
  bool available;

  factory UserCartProdutModel.fromJson(Map<String, dynamic> json) =>
      UserCartProdutModel(
        id: json["id"] ?? '',
        userID: json["userID"] ?? '',
        productImage: json["ProductImage"] ?? '',
        productName: json["productName"] ?? '',
        price: json["Price"] ?? 0.0,
        category: json["Category"] ?? "",
        quantity: json["quantity"] ?? 0,
        discription: json["discription"] ?? "",
        documentId: json["documentID"] ?? "",
        available: json["available"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userID": userID,
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

class UserCartProductToFireBase {
  Future addCartModelController(UserCartProdutModel productModel) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase.collection("UserCartModel").doc();
      productModel.id = doc.id;

      doc.set(productModel.toJson()).then((value) => Get.to(BuyingOrdersScreen(
            id: doc.id,
          )));
    } on FirebaseException catch (e) {
      log('Error ${e.message.toString()}');
    }
  }
}
