//     final UserFavtModel = UserFavtModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pixels_user/view/cart/user_cart_screen/userCart_screen.dart';

UserFavtModel UserFavtModelFromJson(String str) =>
    UserFavtModel.fromJson(json.decode(str));

String UserFavtModelToJson(UserFavtModel data) => json.encode(data.toJson());

class UserFavtModel {
  UserFavtModel({
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
  double price;
  String category;
  int quantity;
  String discription;
  String documentId;
  bool available;

  factory UserFavtModel.fromJson(Map<String, dynamic> json) => UserFavtModel(
        id: json["id"] ?? '',
        productImage: json["ProductImage"] ?? '',
        productName: json["productName"] ?? '',
        price: json["Price"] ?? 0.0,
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

// Add to firebase user favourites produts..............

class AddUserFavProductToFireBase {
  Future addProductController(UserFavtModel productModel) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase.collection("UserFavourtiesProduct").doc();
      productModel.id = doc.id;

      doc.set(productModel.toJson()).then((value) => Get.to(
            UserCartScreen(id: doc.id),
          ));
    } on FirebaseException catch (e) {
      log('Error ${e.message.toString()}');
    }
  }
}
