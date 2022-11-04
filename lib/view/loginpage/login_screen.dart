import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixels_user/view/loginpage/widget/loginPhone.dart';
import '../../controller/Getx/google_signin.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 300.h,
              ),
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'Pixels-Co',
                style: GoogleFonts.montserrat(
                    fontSize: 50, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 14.h,
              ),
              const Text(
                'Finance is a gun .Politics is knowing when to pull\n                                 the Trigger.',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 50.h,
              ),
              ElevatedButton(
                onPressed: () async {
                  await GoogleSiginController().googleLogin(context);
                  // Get.to(GoogleSiginController());
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  'SIGN IN WITH GOOGLE',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 85, 255),
                    fixedSize: const Size(400, 70),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
              SizedBox(
                height: 27.h,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.offAll( ScreenPhoneLogin());
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  'SIGN IN WITH PHONE',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: const Color.fromARGB(255, 255, 153, 0),
                    fixedSize: const Size(400, 70),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
