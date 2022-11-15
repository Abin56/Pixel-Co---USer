import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pixels_user/model/userCartModel.dart';
import '../../model/allProdut__mode.dart';

class PixelsController extends GetxController {
  double checkoutPrice = 0;
  double coupenvalue = 5000;
  double newValue = 0;
  double totalAmount = 0;
  final count = 0.obs;
  List<Map<String, dynamic>> list1 = [];
  List<Map<String, dynamic>> categoryCollections = [];

  @override
  void onInit() {
    fetchingCategory();
    contrycode();

    super.onInit();
  }

  Stream<List<AllProductModel>> getProduct(String type) {
    String catData = '';
    for (Map<String, dynamic> map in categoryCollections) {
      if (map["CategoryName"] == type) {
        catData = map["id"];
      }
    }
    final data = FirebaseFirestore.instance
        .collection("AllProducts")
        .where('Category', isEqualTo: catData)
        .snapshots();
    final d = data.map((event) =>
        event.docs.map((e) => AllProductModel.fromJson(e.data())).toList());
    log(d.toString());
    return d;
  }

  int currentIndex = 0;
  currentindex(int index) {
    currentIndex = index;
    update();
  }

  contrycode() {
    // final countryCodee = countrycode.text = '  +91';
  }
  Future<List<Map<String, dynamic>>> fetchingCategory() async {
    List<Map<String, dynamic>> list = [];
    await FirebaseFirestore.instance
        .collection("allCategory")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        list.add(element.data());
      });
    });
    list1 = list;
    log(list.toString());

    categoryCollections = list;
    log(list.toString(), name: "calling");
    update();
    return list;
  }

  increMentCount(UserCartProdutModel product) async {
    product.quantity = product.quantity + 1;
    FirebaseFirestore.instance
        .collection("UserCartModel")
        .doc(product.id)
        .set(product.toJson());
  }

  decrementCount(UserCartProdutModel product) {
    product.quantity = product.quantity - 1;
    FirebaseFirestore.instance
        .collection("UserCartModel")
        .doc(product.id)
        .set(product.toJson());
    totalAmount -= product.price;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> cartModelCalling() {
    return FirebaseFirestore.instance
        .collection("UserCartModel")
        .where('userID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  Stream<List<UserCartProdutModel>> getProductStream() {
    totalAmount = 0;
    return FirebaseFirestore.instance
        .collection("UserCartModel")
        .where('userID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => UserCartProdutModel.fromJson(doc.data()))
            .toList());
  }

  newCoupenValue() {
    newValue = totalAmount - coupenvalue;

    log(newValue.toString());
    update();
  }
}
