// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/color.dart';

class ButtonContainerWidget extends StatelessWidget {
  double curving;
  int colorindex;
  double height;
  double width;
  Widget child;
  ButtonContainerWidget({
    required this.curving,
    required this.child,
    required this.colorindex,
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
        boxShadow: [
          BoxShadow(
            color: containerColor[colorindex].first.withOpacity(0.4),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(4, 4),
          ),
        ],
        gradient: LinearGradient(
            colors: containerColor[colorindex],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight),
        borderRadius: BorderRadius.all(
          Radius.circular(curving),
        ),
      ),
      child: child,
    );
  }
}
