import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pixels_user/model/userAddress.dart';

class AddressController extends GetxController {
  List<UserAddressModel> list1 = [];
  RxBool isLoading = false.obs;
  List<Map<String, dynamic>> categoryCollections = [];
  Future<List<UserAddressModel>> fetchingAddress() async {
    // List<Map<String, dynamic>> list = [];
    final data =
        await FirebaseFirestore.instance.collection("UserAddressModel").get();
    final d =
        data.docs.map((elements) => UserAddressModel.fromJson(elements.data())).toList();
    return d;
  }

  @override
  void onInit() {
    fetchingAddress().then((value) {
      isLoading.value = false;
      list1 = value;
    });
    super.onInit();
  }
}
