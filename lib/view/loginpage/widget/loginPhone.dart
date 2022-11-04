// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pixels_user/controller/Getx/getx.dart';
import 'package:pixels_user/view/colors/color.dart';
import 'package:pixels_user/view/core/const.dart';
import '../../../controller/phone_otp_Bloc/auth_cubit.dart';
import '../../../controller/phone_otp_Bloc/auth_state.dart';
import 'otpverfication-screen.dart';

final countrycode = TextEditingController();
final phonenumberController = TextEditingController();
final getcontroller = Get.put(PixelsController());

class ScreenPhoneLogin extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  ScreenPhoneLogin({super.key});

  @override
  Widget build(BuildContext context) {
    getcontroller.onInit();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  LottieBuilder.asset('assest/Images/otpverfication.json'),
                  const Text(
                    'Phone Verification',
                    style: TextStyle(fontSize: 20),
                  ),
                  sizedboxH,
                  const Text('We need to register your phone before getting'),
                  sizedboxH,
                  const Text('started!'),
                  sizedboxH,
                  Container(
                    height: 55.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: whitecolor),
                            controller: countrycode,
                            cursorColor: Colors.amber,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        ),
                        const Text(
                          '|',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.grey,
                              fontWeight: FontWeight.w100),
                        ),
                        // Icon(Icons.line),
                        Expanded(
                          child: TextField(
                            controller: phonenumberController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: whitecolor),
                            decoration: const InputDecoration(
                                hintText: 'Phone number',
                                counterText: "",
                                border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizedboxH,
                  sizedboxH,
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthCodeSentState) {
                        Get.offAll(ScreenOtpVerfication());
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              // ignore: deprecated_member_use
                              primary: Colors.green.shade600),
                          onPressed: () async {
                            String phoneNumber =
                                "+91${phonenumberController.text.trim()}";
                            BlocProvider.of<AuthCubit>(context)
                                .sentOTP(phoneNumber);
                          },
                          child: const Text('Send OTP'));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
