import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixels_user/view/colors/color.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:slider_button/slider_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
    log("PaymentDone!!!!!!!!");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log("PaymentError!!!!!!!!");
  }

  void _handlePaymentWallet(ExternalWalletResponse response) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 300.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  style: const TextStyle(color: whitecolor),
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: const Color.fromARGB(0, 16, 16, 16),
                    hintText: 'Price',
                    hintStyle: const TextStyle(color: Colors.grey),
                    focusColor: Colors.green,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              SliderButton(
                icon: const Icon(Icons.arrow_forward_ios_rounded),
                height: 70.h,
                width: 280.w,
                baseColor: Colors.blue,
                backgroundColor: const Color.fromARGB(255, 26, 32, 44),
                action: () {
                  //make payment
                  var options = {
                    'key': 'rzp_test_GvnCt2Gd3dg3Tv',
                    //amount will be multiple of 100
                    'amount': _amountController.text, //so its pay 500
                    'name': 'AbinJohn',
                    'description': 'PixelCO',
                    'timeout': 300, // in seconds
                    'prefill': {
                      'contact': '8089262564',
                      'email': 'abinjohn8089@gmail.com'
                    }
                  };

                  _razorpay.open(options);
                },
                label: const Text(
                  'Pay Amount',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
