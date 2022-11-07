// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewMorphismBlackWidget extends StatelessWidget {
  double height;
  double width;
  Widget child;
  NewMorphismBlackWidget({
    required this.child,
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 36, 44, 59),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(255, 19, 22, 30),
              offset: Offset(10, 10),
              blurRadius: 5,
              inset: true),
          BoxShadow(
              color: Color.fromARGB(193, 123, 136, 156),
              offset: Offset(-3, -3),
              blurRadius: 2,
              inset: true)
        ],
      ),
      child: child,
    );
  }
}
