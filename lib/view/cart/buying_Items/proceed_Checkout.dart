import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixels_user/view/cart/checkout/checkout_screen.dart';
import 'package:slider_button/slider_button.dart';

import '../../../controller/Getx/getx.dart';
import '../../colors/color.dart';
import '../../core/const.dart';
import '../../widget/buttonContainer_widget.dart';
import '../../widget/newMorphism_black.dart';

class ProceedToCheckOut extends StatelessWidget {
  bool apply = false;
  ProceedToCheckOut({
    Key? key,
    required this.getxController,
  }) : super(key: key);

  final PixelsController getxController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          sizedboxH,
          const Text(
            'Your cart qualifies for free shipping\nGet flat 5000/- OFF! on Purchace above 50000',
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
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  ButtonContainerWidget(
                    curving: 10,
                    colorindex: 3,
                    height: 48.h,
                    width: 130.w,
                    child: Center(
                      child: getxController.totalAmount <= 50000
                          ? const Text(
                              'InvalidCoupen!',
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            )
                          : GestureDetector(
                              onTap: () {
                             
                                getxController.newCoupenValue();
                                log('Appled!!!!!!!!!!!');
                              },
                              child: const Text(
                                'Apply',
                                style:
                                    TextStyle(color: whitecolor, fontSize: 16),
                              ),
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
            children: [
              const Text(
                'Subtotal :',
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
              Text(
                '${getxController.totalAmount}',
                style: const TextStyle(
                    color: Color.fromARGB(255, 248, 252, 255), fontSize: 13),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              'Discount',
              style: TextStyle(color: Colors.white, fontSize: 11),
            ),
            SizedBox(
              height: 10.h,
            ),
            GetBuilder<PixelsController>(
              init: getxController,
              initState: (newDiscount) {},
              builder: (newDiscount) {
                return Text(
                  newDiscount.newValue == 0
                      ? '0'
                      : newDiscount.coupenvalue.toString(),
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                );
              },
            ),
          ]),
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
          SizedBox(
            height: 10.h,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              'Total',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            GetBuilder<PixelsController>(
              init: getxController,
              initState: (newData) {},
              builder: (newData) {
                return Text(
                  newData.newValue == 0
                      ? '${newData.totalAmount} '
                      : '${newData.newValue} ',
                  style: const TextStyle(color: Colors.blue, fontSize: 17),
                );
              },
            ),
          ]),
          SizedBox(
            height: 15.h,
          ),
          GetBuilder<PixelsController>(
            init: getxController,
            initState: (newData) {},
            builder: (newData) {
              return SliderButton(
                icon: const Icon(Icons.arrow_forward_ios_rounded),
                height: 60,
                baseColor: Colors.blue,
                backgroundColor: const Color.fromARGB(255, 26, 32, 44),
                action: () {
                  newData.newValue == 0
                      ? Get.to(CheckOutScreen(
                          totalPrice: getxController.totalAmount,
                        ))
                      : Get.to(CheckOutScreen(
                          totalPrice: getxController.newValue,
                        ));
                },
                label: const Text(
                  'Proceed to Checkout',
                  style: TextStyle(fontSize: 15),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
