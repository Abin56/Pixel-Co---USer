// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixels_user/view/buying_Items/buying_items.dart';
import 'package:pixels_user/view/widget/boxdecoration_widget.dart';

class UserCartScreen extends StatelessWidget {
  const UserCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      body: SafeArea(
          child: BoxDecorationWidget(
              height: 200.h,
              width: double.infinity.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                            AssetImage('assest/Images/png_camera.png'),
                      ),
                      Column(
                        children: [
                          const Text(
                            "Camera",
                            style: TextStyle(fontSize: 30),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Price : ",
                                  style: TextStyle(color: Colors.grey)),
                              Text(
                                "30000 ",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: BoxDecorationWidget(
                          height: 50.h,
                          width: 130.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              Text(
                                'Remove',
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(BuyingOrdersScreen());
                        },
                        child: BoxDecorationWidget(
                          height: 50.h,
                          width: 130.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(
                                Icons.flash_on_outlined,
                                color: Colors.amber,
                              ),
                              Text(
                                'Buy Now',
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ))),
    );
  }
}
