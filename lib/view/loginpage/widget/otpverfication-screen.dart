// ignore_for_file: file_names, deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:pixels_user/controller/phone_otp_Bloc/auth_cubit.dart';
import 'package:pixels_user/view/widget/screen_otp_scess.dart';
import '../../../controller/phone_otp_Bloc/auth_state.dart';
import '../../core/const.dart';

class ScreenOtpVerfication extends StatelessWidget {
  final otpController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  ScreenOtpVerfication({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    // ignore: unused_local_variable
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    // ignore: unused_local_variable
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    // ignore: unused_local_variable
    var code = "";
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  LottieBuilder.asset(
                      'assest/Images/105761-verification-code-otp-v2.json',
                      height: 300.h),
                  const Text(
                    'Otp Verification',
                    style: TextStyle(fontSize: 20),
                  ),
                  sizedboxH,
                  const Text('We need to register your phone before getting'),
                  sizedboxH,
                  const Text('started!'),
                  sizedboxH,
                  Pinput(
                    controller: otpController,
                    length: 6,
                    showCursor: true,
                    onChanged: (value) {
                      code = value;
                    },
                  ),
                  sizedboxH,
                  sizedboxH,
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthLoggedInState) {
                        Get.offAll(const SucessFullOTP());
                      } else if (state is AuthErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.red,
                                duration: Duration(milliseconds: 2000),
                                content: Text("Somthing Wrong!!!!!")));
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
                            primary: Colors.green.shade600),
                        onPressed: () async {
                          BlocProvider.of<AuthCubit>(context)
                              .verifyOTP(otpController.text);
                        },
                        child: const Text('Verify Phone Number'),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
