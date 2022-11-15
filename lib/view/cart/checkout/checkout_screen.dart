// ignore_for_file: sort_child_properties_last, must_be_immutable

import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pixels_user/controller/Getx/address_Controller.dart';
import 'package:pixels_user/controller/Getx/getx.dart';
import 'package:pixels_user/model/userAddress.dart';
import 'package:pixels_user/view/cart/addUser_Address/add_new_Address.dart';
import 'package:pixels_user/view/cart/buying_Items/buying_items.dart';
import 'package:pixels_user/view/cart/payment/payment_screen.dart';
import 'package:pixels_user/view/colors/color.dart';
import 'package:pixels_user/view/core/const.dart';
import 'package:pixels_user/view/widget/buttonContainer_widget.dart';
import 'package:pixels_user/view/widget/newMorphism_black.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:slider_button/slider_button.dart';

class CheckOutScreen extends StatefulWidget {
  var addressid;
  var id;
  var totalPrice;

  CheckOutScreen({this.id, this.addressid, this.totalPrice, super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final _amountController = TextEditingController();
  final _razorpay = Razorpay();
  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handlePaymentWallet);

    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    afterPaymentSucess();

    log("PaymentDone!!!!!!!!");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log("PaymentError!!!!!!!!");
  }

  void _handlePaymentWallet(ExternalWalletResponse response) {}
  final addressController = Get.put(AddressController());

  int selectValue = 1;

  @override
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
                        Get.to(BuyingOrdersScreen());
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
                    addressController.list1.isEmpty
                        ? const Text('')
                        : NewMorphismBlackWidget(
                            height: 200.h,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  sizedboxH,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text(
                                        'Deliver To  :',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          FirebaseFirestore.instance
                                              .collection("UserAddressModel")
                                              .doc(widget.id)
                                              .delete()
                                              .then((value) =>
                                                  AddNewDeliveryAddress());
                                        },
                                        child: ButtonContainerWidget(
                                          curving: 30,
                                          colorindex: 1,
                                          height: 40.h,
                                          width: 100.w,
                                          child: const Center(
                                            child: Text(
                                              "⚒️  Change",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  sizedboxH,
                                  sizedboxH,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Name :'),
                                      Text(
                                        addressController.list1[0].userName,
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                  sizedboxH,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('PhoneNumber :'),
                                      Text(
                                        addressController.list1[0].phoneNumber,
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                  sizedboxH,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('PinCode :'),
                                      Text(
                                        addressController.list1[0].pinCode,
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                  sizedboxH,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Address :'),
                                      Text(
                                        addressController.list1[0].userAddress,
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )),
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
                        ? Column(
                            children: [
                              AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    'Please Add Address To Delivery',
                                    speed: const Duration(milliseconds: 50),
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 235, 131, 124),
                                    ),
                                  )
                                ],
                                isRepeatingAnimation: true,
                                repeatForever: false,
                                displayFullTextOnTap: true,
                                stopPauseOnTap: false,
                              ),
                              sizedboxH,
                              AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    '👇',
                                    speed: const Duration(milliseconds: 80),
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                                isRepeatingAnimation: true,
                                displayFullTextOnTap: true,
                              ),
                              sizedboxH,
                              GestureDetector(
                                onTap: () {
                                  Get.to(AddNewDeliveryAddress());
                                },
                                child: ButtonContainerWidget(
                                  curving: 30,
                                  colorindex: 0,
                                  height: 60,
                                  width: 200.w,
                                  child: const Center(
                                    child: Text(
                                      "+ Address",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        //<<<<<<<<<<<<<<<<Payment Mehtod >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                        : SliderButton(
                            icon: const Icon(Icons.arrow_forward_ios_rounded),
                            height: 70.h,
                            width: double.infinity.w,
                            baseColor: Colors.blue,
                            backgroundColor:
                                const Color.fromARGB(255, 26, 32, 44),
                            action: () async {
                              double paymentPrice = 1 * 100;
                              // Get.off(PaymentScreen());
                              //
                              var options = {
                                'key': 'rzp_test_GvnCt2Gd3dg3Tv',
                                //amount will be multiple of 100
                                'amount':
                                    paymentPrice.toString(), //so its pay 500
                                'name': 'AbinJohn',
                                'description': 'PixelCO',
                                'timeout': 300, // in seconds
                                'prefill': {
                                  'contact': '8089262564',
                                  'email': 'abinjohn8089@gmail.com'
                                }
                              };

                              _razorpay.open(options);
                              //
                              try {} on Razorpay catch (e) {
                                log(e.toString());
                              }
                            },
                            label: const Text(
                              'Proceed To PayOnline',
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

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
