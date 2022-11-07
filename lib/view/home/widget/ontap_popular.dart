import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixels_user/view/cart/userCart_screen.dart';
import 'package:pixels_user/view/core/const.dart';
import 'package:pixels_user/view/home/widget/navigation_bar.dart';
import 'package:pixels_user/view/widget/buttonContainer_widget.dart';
import 'package:pixels_user/view/widget/newMorphism_black.dart';
import '../../colors/color.dart';

class OnTapPopular extends StatelessWidget {
  const OnTapPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.offAll(const NavigationBarContoller()),
                    child: ButtonContainerWidget(
                      colorindex: 0,
                      curving: 6,
                      height: 38.h,
                      width: 40,
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: whitecolor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 120,
              backgroundImage: AssetImage('assest/Images/png_camera.png'),
            ),
            NewMorphismBlackWidget(
              height: 400.h,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sony 200mm Zoom',
                      style: TextStyle(fontSize: 25),
                    ),
                    const Text(
                      '6000',
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      children: const [
                        Text(
                          '4.5',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '    (500 reviews)',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                      ],
                    ),
                    sizedboxH,
                    sizedboxH,
                    sizedboxH,
                    const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.off(const UserCartScreen());
                          },
                          child: ButtonContainerWidget(
                            colorindex: 1,
                            curving: 30,
                            height: 60,
                            width: 80,
                            child: const Center(
                              child: Icon(
                                Icons.bookmark_add_outlined,
                                color: whitecolor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 9.6.w,
                        ),
                        ButtonContainerWidget(
                          colorindex: 0,
                          curving: 30,
                          height: 60.h,
                          width: 200.w,
                          child: const Center(
                            child: Text(
                              'Add to bag',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
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
