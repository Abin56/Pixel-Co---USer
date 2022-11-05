import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixels_user/view/cart/userCart_screen.dart';
import 'package:pixels_user/view/widget/buttonContainer_widget.dart';
import 'package:pixels_user/view/widget/newMorphism_black.dart';

import '../../colors/color.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
          child: const Text(
            'PixelsCo.',
            style: TextStyle(fontSize: 30),
          ),
        ),
        ButtonContainerWidget(
          colorindex: 0,
          curving: 10,
          height: 40.h,
          width: 40.w,
          child: IconButton(
            onPressed: () {
              Get.to(const UserCartScreen());
            },
            icon: const Icon(
              Icons.card_travel,
              color: whitecolor,
            ),
          ),
        ),
      ],
    );
  }
}
