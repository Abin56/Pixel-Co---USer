import 'package:flutter/material.dart';

import '../colors/color.dart';

// ignore: must_be_immutable
class BoxDecorationWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var child;
  double height;
  double width;
  BoxDecorationWidget({
    required this.height,
    required this.width,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      
      width: width,
      decoration: BoxDecoration(
        border: Border.all(width: 0.1, color: Colors.amber),
        boxShadow: [
          BoxShadow(
            color: listcolors[0].first.withOpacity(0.4),
            blurRadius: 15,
            spreadRadius: 1,
            offset: const Offset(4, 4),
          )
        ],
        gradient: LinearGradient(
          colors: listcolors[0],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(22),
        ),
      ),
      child: Padding(padding: const EdgeInsets.all(8.0), child: child),
    );
  }
}
