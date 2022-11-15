import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:pixels_user/view/home/widget/navigation_bar.dart';

class MailSucess extends StatelessWidget {
  const MailSucess({super.key});

  @override
  Widget build(BuildContext context) {
    returnScreen(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: LottieBuilder.asset(
            'assest/Images/MaiLogin.json',
            height: 350,
          ),
        ),
      ),
    );
  }
}

returnScreen(context) async {
  await Future.delayed(const Duration(seconds: 4));
  Get.off( NavigationBarContoller());
}
