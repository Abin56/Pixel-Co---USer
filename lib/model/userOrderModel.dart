//     final UserOrdersModel = UserOrdersModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

UserOrdersModel UserOrdersModelFromJson(String str) =>
    UserOrdersModel.fromJson(json.decode(str));

String UserOrdersModelToJson(UserOrdersModel data) =>
    json.encode(data.toJson());

class UserOrdersModel {
  UserOrdersModel({
    //Product side....5
    required this.id,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.quantity,
    //user side...5
    required this.username,
    required this.userNumber,
    required this.userPincode,
    required this.userAddress,
    required this.userCanceloption,
    //order Side...3
    required this.orderTime,
    required this.orderStatus,
  });

  String id;
  String productImage;
  String productName;
  String productPrice;
  String quantity;

  // user Side....5
  String username;
  String userNumber;
  String userPincode;
  String userAddress;
  bool userCanceloption;
  //order..3
  String orderTime;
  String orderStatus;

  factory UserOrdersModel.fromJson(Map<String, dynamic> json) =>
      UserOrdersModel(
        id: json["id"] ?? '',
        productImage: json["ProductImage"] ?? '',
        productName: json["productName"] ?? '',
        productPrice: json["productPrice"] ?? "",
        quantity: json["quantity"] ?? "",
        //User Side..............5
        username: json["username"] ?? "",
        userNumber: json["userNumber"] ?? "",
        userPincode: json["userPincode"] ?? "",
        userAddress: json["userAddress"] ?? "",
        userCanceloption: json["userCanceloption"] ?? "",
        //order side................3
        orderTime: json["orderTime"] ?? "",
        orderStatus: json["orderStatus"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ProductImage": productImage,
        "productName": productName,
        "productPrice": productPrice,
        "quantity": quantity,
        //
        "username": username,
        "userNumber": userNumber,
        "userPincode": userPincode,
        "userAddress": userAddress,
        "userCanceloption": userCanceloption,
        //
        "orderTime": orderTime,
        "orderStatus": orderStatus,
      };
}
