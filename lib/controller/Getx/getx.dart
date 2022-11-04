import 'package:get/get.dart';


class PixelsController extends GetxController {
  @override
  void onInit() {
    contrycode();

    super.onInit();
  }

  int currentIndex = 0;
  currentindex(int index) {
    currentIndex = index;
    update();
  }

  contrycode() {
    // final countryCodee = countrycode.text = '  +91';
  }
}
