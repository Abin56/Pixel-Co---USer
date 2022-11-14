import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/buttonContainer_widget.dart';

class SelectUserAddress extends StatelessWidget {
  const SelectUserAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          GestureDetector(
            // onTap: () => Get.to(UserDeliveryAddress()),
            child: ButtonContainerWidget(
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
          ),
        ],
      )),
    );
  }
}
