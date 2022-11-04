import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pixels_user/view/colors/color.dart';

import '../../view/widget/screen_mail_sucess.dart';

class GoogleSiginController {
  final FirebaseAuth firebase = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future gooleSignOUt() async {
    try {
      await googleSignIn.signOut();
    } on FirebaseAuthException catch (e) {
      Get.snackbar("error", e.message.toString(),
          backgroundColor: Colors.red, colorText: whitecolor);
    } catch (e) {
      log(e.toString());
    }
  }

  googleLogin(context) async {
    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return;
      }
      _user = googleUser;
//
      final googleAuth = await _user!.authentication;
      // log(_user.toString());

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        FirebaseFirestore.instance
            .collection('allUserData')
            .doc(value.user!.uid)
            .set({
          'uid': value.user!.uid,
          'email': value.user!.email,
          'name': value.user!.displayName,
          'phoneNumber': value.user!.phoneNumber,
          'photoURL': value.user!.photoURL,
          'isBlocked': false,
        }).then((value) => Get.offAll(const MailSucess()));
      });
      //   .then((value) async {
      // final UserModel data = UserModel(
      //   uid: value.user!.uid,
      //   username: value.user!.displayName!,
      //   password: "",
      //   email: value.user!.email!,
      // );

      // await firestore
      //     .collection("userData")
      //     .doc(value.user!.uid)
      //     .set(data.toJson());
      //   Get.offAll(() => const ScreenHomePage());
      //   Get.snackbar("Done",
      //       "Registration of  ${value.user!.email.toString()} is successful",
      //       backgroundColor: kGreen, colorText: kWhite);
      //   // update();
      //   // return value;
      // });
    } on FirebaseAuthException catch (e) {
      Get.snackbar("error", e.message.toString(),
          backgroundColor: Colors.red, colorText: whitecolor);
    } catch (e) {
      log(e.toString());
    }
  }
}
