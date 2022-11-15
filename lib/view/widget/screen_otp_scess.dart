import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pixels_user/view/colors/color.dart';
import 'package:pixels_user/view/home/widget/navigation_bar.dart';

class SucessFullOTP extends StatelessWidget {
  const SucessFullOTP({super.key});

  @override
  Widget build(BuildContext context) {
    returnScreen(context);
    return Scaffold(
      backgroundColor: whitecolor,
      body: SafeArea(
        child: Center(
          child: LottieBuilder.asset(
            'assest/Images/LoginSucces.json',
            height: 300,
          ),
        ),
      ),
    );
  }
}

returnScreen(context) async {
  await Future.delayed(const Duration(seconds: 3));
  Get.off( NavigationBarContoller());
}
