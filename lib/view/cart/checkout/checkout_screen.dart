import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixels_user/view/cart/payment/payment_screen.dart';
import 'package:pixels_user/view/colors/color.dart';
import 'package:pixels_user/view/core/const.dart';
import 'package:pixels_user/view/widget/buttonContainer_widget.dart';
import 'package:pixels_user/view/widget/newMorphism_black.dart';
import 'package:slider_button/slider_button.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  ButtonContainerWidget(
                    curving: 10,
                    colorindex: 0,
                    height: 40.h,
                    width: 40.w,
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: whitecolor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  const Text(
                    "Checkout",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
              SizedBox(
                height: 80.h,
              ),
              ButtonContainerWidget(
                curving: 30,
                colorindex: 0,
                height: 60.h,
                width: 180.w,
                child: const Center(
                  child: Text(
                    '+ Address',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              SliderButton(
                icon: const Icon(Icons.arrow_forward_ios_rounded),
                height: 70.h,
                width: double.infinity.w,
                baseColor: Colors.blue,
                backgroundColor: const Color.fromARGB(255, 26, 32, 44),
                action: () {
                  Get.off(const PaymentScreen());
                },
                label: const Text(
                  'Select Payment Method',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                width: 30.w,
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                children: [
                  const Text(
                    "Order Summary",
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Subtotal : ",
                        style: TextStyle(color: whitecolor, fontSize: 20),
                      ),
                      Text(
                        "46635.98",
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ],
                  ),
                  sizedboxH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Delivey Fee : ",
                        style: TextStyle(color: whitecolor, fontSize: 20),
                      ),
                      Text(
                        "0 ",
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  NewMorphismBlackWidget(
                    width: 320.w,
                    height: 60.h,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Total :',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 165, 157, 157),
                                  fontSize: 17),
                            ),
                            Text('59988.00',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
