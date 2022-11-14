// ignore_for_file: sort_child_properties_last, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixels_user/controller/Getx/address_Controller.dart';
import 'package:pixels_user/controller/Getx/getx.dart';
import 'package:pixels_user/model/userAddress.dart';
import 'package:pixels_user/view/cart/payment/payment_screen.dart';
import 'package:pixels_user/view/colors/color.dart';
import 'package:pixels_user/view/core/const.dart';
import 'package:pixels_user/view/widget/buttonContainer_widget.dart';
import 'package:pixels_user/view/widget/newMorphism_black.dart';
import 'package:slider_button/slider_button.dart';

class CheckOutScreen extends StatefulWidget {
  double totalPrice;
  CheckOutScreen({required this.totalPrice, super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final addressController = Get.put(AddressController());

  int selectValue = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: GetX<AddressController>(
      init: addressController,
      builder: (_) {
        if (addressController.isLoading.value == true) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: ButtonContainerWidget(
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
                  height: 20.h,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    NewMorphismBlackWidget(
                      height: 200.h,
                      width: double.infinity,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return ButtonContainerWidget(
                              curving: 30,
                              colorindex: 0,
                              height: 60,
                              width: double.infinity,
                              child: Text(''),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: addressController.list1.length),
                    ),
                    sizedboxH,
                    sizedboxH,
                    const Text(
                      "Order Summary",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Subtotal : ",
                          style: TextStyle(color: whitecolor, fontSize: 20),
                        ),
                        Text(
                          widget.totalPrice.toString(),
                          style:
                              const TextStyle(color: Colors.blue, fontSize: 20),
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
                          "Free ",
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
                            children: [
                              const Text(
                                'Total :',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 165, 157, 157),
                                    fontSize: 17),
                              ),
                              Text(widget.totalPrice.toString(),
                                  style: const TextStyle(
                                      color: Colors.green, fontSize: 20))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    addressController.list1.isEmpty
                        ? Text("Empty")
                        : SliderButton(
                            icon: const Icon(Icons.arrow_forward_ios_rounded),
                            height: 70.h,
                            width: double.infinity.w,
                            baseColor: Colors.blue,
                            backgroundColor:
                                const Color.fromARGB(255, 26, 32, 44),
                            action: () {
                              Get.off(const PaymentScreen());
                            },
                            label: const Text(
                              'Select Payment Method',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                  ],
                ),
              ],
            ),
          );
        }
      },
    )));
  }
}
