// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixels_user/view/colors/color.dart';
import 'package:pixels_user/view/user_Orders/details_Orders.dart';
import 'package:pixels_user/view/widget/buttonContainer_widget.dart';

class UserOrdersScreen extends StatelessWidget {
  const UserOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "My Orders",
          style: TextStyle(fontSize: 23),
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Get.off(const DetailsofOrder());
            },
            child: ButtonContainerWidget(
              curving: 30,
              colorindex: 0,
              height: 100.h,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 45.r,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        const AssetImage('assest/Images/png_camera.png'),
                  ),
                  const Text(
                    "DSLR",
                    style: TextStyle(fontSize: 20),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: whitecolor,
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
