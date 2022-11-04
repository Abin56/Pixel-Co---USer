import 'package:flutter/material.dart';
import '../../colors/color.dart';
getBottomSheet({required context}) {
  return showModalBottomSheet(
    context: context,
    builder: (ctx) {
      // ignore: sized_box_for_whitespace
      return Container(
          height: 400,
          decoration: BoxDecoration(
            color: Colors.red,
            // borderRadius: BorderRadius.circular(30),
            border: Border.all(color: whitecolor.withOpacity(0.13)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                whitecolor.withOpacity(0.1),
                whitecolor.withOpacity(0.5)
              ],
            ),
          ));
    },
  );
}
