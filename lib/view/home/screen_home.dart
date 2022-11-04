import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixels_user/view/home/widget/app_bar.dart';
import 'package:pixels_user/view/home/widget/popular_widget.dart';
import 'package:pixels_user/view/home/widget/top_ad_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const AppWidget(),
              const TopAdWidget(),
              // LimitedBox(
              //   maxHeight: 200.h,
              //   // maxWidth: double.infinity,
              //   child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     children: List.generate(
              //       10,
              //       (index) => TopAdWidget(),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 10.h,
              ),
              const Text(
                'Popular',
                style: TextStyle(fontSize: 23),
              ),
              const SizedBox(
                height: 10,
              ),
              const PopularWidget(),
            ],
          ),
        ),
      ),
      //<<<<<<<<<<<<<<<Bottom Navigation>>>>>>>>>>>>>>>>>>>>
    );
  }
}
