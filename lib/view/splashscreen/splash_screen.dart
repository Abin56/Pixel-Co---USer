import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixels_user/view/home/widget/navigation_bar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    splashNavigator(context);
    return const Scaffold();
  }
}

Future<void> splashNavigator(context) async {
  await Future.delayed(const Duration(seconds: 5));
  Get.offAll( NavigationBarContoller());
}
