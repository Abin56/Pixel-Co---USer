// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixels_user/view/core/const.dart';
import 'package:pixels_user/view/widget/newMorphism_black.dart';

class DetailsofOrder extends StatelessWidget {
  const DetailsofOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const Text(
              'View Order Details',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: NewMorphismBlackWidget(
                height: 180.h,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 50.r,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              const AssetImage('assest/Images/png_camera.png'),
                        ),
                        SizedBox(
                          width: 40.w,
                        ),
                        const Text(
                          "DSLR",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    const Center(
                      child: Text("Qty : 1"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Order ID:",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Text(
                          "UBGUGYF*GVGCY",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    sizedboxH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Order Total:",
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        Text(
                          "4453.54",
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
