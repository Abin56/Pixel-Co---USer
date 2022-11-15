import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pixels_user/controller/Getx/getx.dart';
import 'package:pixels_user/view/user_Orders/screen_UserOrderi.dart';

import '../../categories/screen_categories.dart';
import '../../colors/color.dart';
import '../../profile/screen_profile.dart';
import '../screen_home.dart';

final getcontroller = Get.put(PixelsController());

class NavigationBarContoller extends StatelessWidget {
  var addressid;
   NavigationBarContoller({ this.addressid, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PixelsController>(
        init: getcontroller,
        builder: (_) {
          return Scaffold(
            extendBody: true,
            // backgroundColor: Colors.red,
            body: screens[getcontroller.currentIndex],
            bottomNavigationBar: Container(
              height: 80,
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: whitecolor.withOpacity(0.13)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                    whitecolor.withOpacity(0.15),
                    whitecolor.withOpacity(0.05)
                  ],
                ),
              ),
              child: GNav(
                // tabBackgroundGradient: LinearGradient(
                //   colors: glassmorphism[0],
                //   begin: Alignment.centerLeft,
                //   end: Alignment.centerRight,
                // ),
                // backgroundColor: Colors.amber,
                // curve: Curves.easeOutExpo,
                // haptic: true,
                gap: 8,
                rippleColor: Colors.grey,
                // hoverColor: Colors.amber,
                activeColor: whitecolor,
                // duration: Duration(microseconds: 300),
                // tabBackgroundColor: Colors.red,
                color: whitecolor,
                tabs: const [
                  GButton(
                      iconSize: 20,
                      icon: LineIcons.home,
                      text: 'Home',
                      style: GnavStyle.google),
                  GButton(
                    iconSize: 20,
                    icon: Icons.category,
                    text: 'Category',
                  ),
                  GButton(
                    iconSize: 20,
                    // iconSize: 10,
                    icon: Icons.shopify_rounded,
                    text: 'Orders',
                  ),
                  GButton(
                    iconSize: 20,
                    icon: LineIcons.user,
                    text: 'Profile',
                  )
                ],
                selectedIndex: getcontroller.currentIndex,
                onTabChange: (value) {
                  getcontroller.currentindex(value);
                },
              ),
            ),
          );
        });
  }
}

var screens = [
  ScreenHome(),
  ScreenCategories(),
  const UserOrdersScreen(),
  const ScreenProfile()
];

class GlassBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final child;
  const GlassBox({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(2),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            alignment: Alignment.bottomCenter,
            child: child,
          ),
        ),
      ),
    );
  }
}
