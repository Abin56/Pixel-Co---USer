// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixels_user/view/cart/checkout/checkout_screen.dart';
import 'package:pixels_user/view/colors/color.dart';
import 'package:pixels_user/view/core/const.dart';
import 'package:pixels_user/view/widget/buttonContainer_widget.dart';
import 'package:pixels_user/view/widget/newMorphism_black.dart';
import 'package:slider_button/slider_button.dart';

class BuyingOrdersScreen extends StatelessWidget {
  const BuyingOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 44, 59),
      // backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Row(
                children: [
                  ButtonContainerWidget(
                    curving: 8,
                    colorindex: 0,
                    height: 40,
                    width: 40,
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: whitecolor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  const Text(
                    "My Shopping Cart",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              sizedboxH,
              SizedBox(
                height: 370.h,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 110.h,
                        child: Row(
                          children: [
                            NewMorphismBlackWidget(
                              height: 86.h,
                              width: 86.h,
                              child: Container(
                                height: 80.h,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assest/Images/png_camera.png'))),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  'Nikon- DSLR',
                                  style: TextStyle(fontSize: 17),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Price : ',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                      const Text(
                                        '3000',
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 16),
                                      ),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      ButtonContainerWidget(
                                          curving: 10,
                                          child: const Center(
                                              child: Icon(
                                            Icons.add,
                                            color: whitecolor,
                                          )),
                                          colorindex: 0,
                                          height: 30.h,
                                          width: 30.w),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      const Text("1"),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      ButtonContainerWidget(
                                          curving: 10,
                                          child: const Center(
                                              child: Icon(
                                            Icons.remove,
                                            color: whitecolor,
                                          )),
                                          colorindex: 4,
                                          height: 30.h,
                                          width: 30.w)
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: Colors.blue,
                      );
                    },
                    itemCount: 10),
              ),
              SizedBox(
                height: 400,
                child: Column(
                  children: [
                    sizedboxH,
                    const Text(
                      'Your cart qualifies for free shipping',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    NewMorphismBlackWidget(
                      height: 80.h,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'PIXELS87h',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            ButtonContainerWidget(
                              curving: 10,
                              colorindex: 3,
                              height: 48.h,
                              width: 130.w,
                              child: const Center(
                                child: Text(
                                  'Apply',
                                  style: TextStyle(
                                      color: whitecolor, fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Subtotal :',
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                        Text(
                          '61007.9',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Delivery Fee',
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                          Text(
                            '0%',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ]),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Discount',
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                          Text(
                            '30%',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ]),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Total',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            '💲434442.99',
                            style: TextStyle(
                                color: Color.fromARGB(255, 91, 171, 236),
                                fontSize: 16),
                          ),
                        ]),
                    SizedBox(
                      height: 10.h,
                    ),
                    SliderButton(
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                      height: 60,
                      baseColor: Colors.blue,
                      backgroundColor: const Color.fromARGB(255, 26, 32, 44),
                      action: () {
                        Get.off(CheckOutScreen());
                      },
                      label: const Text(
                        'Proceed to Checkout',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
