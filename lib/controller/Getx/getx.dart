import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../model/allProdut__mode.dart';

class PixelsController extends GetxController {
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
}
