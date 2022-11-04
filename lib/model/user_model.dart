// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        required this.uid,
        required this.email,
        required this.name,
        required this.phoneNumber,
        required this.photoUrl,
        required this.isBlocked,
    });

    String uid;
    String email;
    String name;
    String phoneNumber;
    String photoUrl;
    bool isBlocked;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        email: json["email"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        photoUrl: json["photoURL"],
        isBlocked: json["isBlocked"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "phoneNumber": phoneNumber,
        "photoURL": photoUrl,
        "isBlocked": isBlocked,
    };
}
