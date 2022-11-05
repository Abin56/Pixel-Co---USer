import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixels_user/controller/Getx/google_signin.dart';
import 'package:pixels_user/view/colors/color.dart';
import 'package:pixels_user/view/core/const.dart';
import 'package:pixels_user/view/loginpage/login_screen.dart';
import 'package:pixels_user/view/profile/widget/get_bottomsheet.dart';
import '../../controller/phone_otp_Bloc/auth_cubit.dart';
import '../../controller/phone_otp_Bloc/auth_state.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      body: Stack(
        children: [
          Positioned(
            top: -150,
            left: -100,
            child: Container(
              height: 166,
              width: 166,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.0),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 200,
                  sigmaY: 200,
                ),
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          Positioned(
            top: 500,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 59, 10, 255).withOpacity(0.7),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 200,
                  sigmaY: 200,
                ),
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                Container(
                  height: 600.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: whitecolor.withOpacity(0.13)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [
                        whitecolor.withOpacity(0.10),
                        whitecolor.withOpacity(0.10)
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              getBottomSheet(context: context);
                            },
                            icon: const Icon(
                              Icons.menu,
                              color: whitecolor,
                              size: 25,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Text(
                            'Welcome Chief!',
                            style: TextStyle(fontSize: 32),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 200,
                        // color: Colors.amber,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 4),
                            color: Colors.transparent,
                            shape: BoxShape.circle),
                      ),
                      sizedboxH,
                      const Text(
                        'Abin John',
                        style: TextStyle(fontSize: 35),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Login Id :',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          )
                        ],
                      ),
                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is AuthLoggedOutState) {
                            Get.offAll(const ScreenLogin());
                          }
                        },
                        builder: (context, state) {
                          return TextButton.icon(
                              onPressed: () async {
                                await GoogleSiginController().gooleSignOUt();
                                await FirebaseAuth.instance
                                    .signOut()
                                    .then((value) async {
                                  Get.to(const ScreenLogin());
                                });
                                // ignore: use_build_context_synchronously
                                BlocProvider.of<AuthCubit>(context).logOut();
                              },
                              icon: const Icon(Icons.sign_language_outlined),
                              label: const Text('Sign Out'));
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
