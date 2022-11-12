// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:pixels_user/view/colors/color.dart';

// class SliderButtonWidget extends StatefulWidget {
//   @override
//   _SliderButtonWidgetState createState() => _SliderButtonWidgetState();
// }

// class _SliderButtonWidgetState extends State<SliderButtonWidget> {
//   double translateX = 0.0;
//   double translateY = 0.0;
//   double myWidth = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       width: MediaQuery.of(context).size.width - 100,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(50.00), color: Colors.blue[50]),
//       child: GestureDetector(
//         onHorizontalDragUpdate: (event) async {
//           if (event.primaryDelta! > 10) {
//             _incTanXval();
//           }
//         },
//         child: Row(
//           children: [
//             paymentSucessFull(),
//             myWidth == 0.0
//                 ? const Expanded(
//                     child: Center(
//                     child: Text(
//                       'Swipe to make payment',
//                       style: TextStyle(color: Colors.blue, fontSize: 15),
//                     ),
//                   ))
//                 : const SizedBox()
//           ],
//         ),
//       ),
//     );
//   }

//   Widget paymentSucessFull() {
//     return Transform.translate(
//       offset: Offset(translateX, translateY),
//       child: AnimatedContainer(
//           duration: Duration(milliseconds: 200),
//           curve: Curves.linear,
//           width: 100 + myWidth,
//           height: 100,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(50), color: Colors.blue),
//           child: myWidth > 0.0
//               ? Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.check,
//                       color: whitecolor,
//                       size: 30,
//                     ),
//                     Flexible(
//                         child: Text(
//                       'Payment successful',
//                       style: TextStyle(color: Colors.white, fontSize: 20),
//                     )),
//                   ],
//                 )
//               : Icon(
//                   Icons.navigate_next,
//                   color: whitecolor,
//                   size: 50,
//                 )),
//     );
//   }

//   _incTanXval() async {
//     log('working');
//     int canLoop = -1;
//     for (var i = 0; canLoop == -1; i++) {
//       await Future.delayed(Duration(milliseconds: 4), () {
//         setState(() {
//           if (translateX + 1 <
//               MediaQuery.of(context).size.width - (200 + myWidth)) {
//             translateX += 1;
//             myWidth = MediaQuery.of(context).size.width - (200 + myWidth);
//           } else {
//             setState(() {
//               canLoop = 1;
//             });
//           }
//         });
//       });
//     }
//   }
// }


