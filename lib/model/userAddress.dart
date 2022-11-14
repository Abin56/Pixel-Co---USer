//     final UserAddressModel = UserAddressModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

UserAddressModel UserAddressModelFromJson(String str) =>
    UserAddressModel.fromJson(json.decode(str));

String UserAddressModelToJson(UserAddressModel data) =>
    json.encode(data.toJson());

class UserAddressModel {
  UserAddressModel({
    required this.id,
    required this.uid,
    required this.userName,
    required this.phoneNumber,
    required this.pinCode,
    required this.userAddress,
  });

  String id;
  String uid;
  String userName;
  String phoneNumber;
  String pinCode;
  String userAddress;

  factory UserAddressModel.fromJson(Map<String, dynamic> json) =>
      UserAddressModel(
        id: json["id"] ?? '',
        uid: json["uid"] ?? '',
        userName: json["userName"] ?? '',
        phoneNumber: json["phoneNumber"] ?? '',
        pinCode: json["pinCode"] ?? "",
        userAddress: json["OfferpinCode"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "userName": userName,
        "phoneNumber": phoneNumber,
        "pinCode": pinCode,
        "OfferpinCode": userAddress,
      };
}

class UserAddressAddToFireBase {
  Future addUserAddressModelController(UserAddressModel productModel) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase.collection("UserAddressModel").doc();
      productModel.id = doc.id;

      doc.set(productModel.toJson());
      // .then((value) => Get.to(BuyingOrdersScreen(
      //       id: doc.id,
      //     )));
    } on FirebaseException catch (e) {
      log('Error ${e.message.toString()}');
    }
  }
}
