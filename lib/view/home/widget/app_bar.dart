import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixels_user/view/cart/userCart_screen.dart';

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
        const Text(
          'PixelsCo.',
          style: TextStyle(fontSize: 30),
        ),
        IconButton(
          onPressed: () {
            Get.to(const UserCartScreen());
          },
          icon: const Icon(
            Icons.card_travel,
            color: whitecolor,
          ),
        ),
      ],
    );
  }
}
