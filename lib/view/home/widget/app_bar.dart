import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixels_user/controller/Getx/getx.dart';
import 'package:pixels_user/view/cart/user_cart_screen/userCart_screen.dart';
import 'package:pixels_user/view/widget/buttonContainer_widget.dart';

import '../../colors/color.dart';

class AppWidget extends StatelessWidget {
  
  final getxController = Get.put(PixelsController());

  AppWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Center(
          child: Text(
            'PixelsCo.',
            style: TextStyle(fontSize: 30),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(UserCartScreen(
              id: '',
            ));
          },
          child: ButtonContainerWidget(
            colorindex: 0,
            curving: 10,
            height: 40.h,
            width: 40.w,
            child: const Icon(
              Icons.card_travel,
              color: whitecolor,
            ),
          ),
        ),
      ],
    );
  }
}
