import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixels_user/view/core/const.dart';
import 'package:pixels_user/view/home/widget/navigation_bar.dart';
import '../../colors/color.dart';

class OnTapPopular extends StatelessWidget {
  const OnTapPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 49, 49, 49),
                Color.fromARGB(255, 24, 23, 23),
                Color.fromARGB(255, 0, 0, 0),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(22),
            ),
          ),
          height: 1000.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.offAll(const NavigationBarContoller()),
                      child: Container(
                        height: 38.h,
                        width: 40,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: listcolors[0].first.withOpacity(0.4),
                              blurRadius: 15,
                              spreadRadius: 1,
                              offset: const Offset(4, 4),
                            )
                          ],
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 115, 115, 115),
                              Color.fromARGB(255, 68, 68, 68)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomLeft,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back,
                            color: whitecolor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 400.h,
                width: double.infinity,
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
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sony 200mm Zoom',
                        style: TextStyle(fontSize: 25),
                      ),
                      const Text(
                        '6000',
                        style: TextStyle(fontSize: 20),
                      ),
                      Row(
                        children: const [
                          Text(
                            '4.5',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '    (500 reviews)',
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                        ],
                      ),
                      sizedboxH,
                      sizedboxH,
                      sizedboxH,
                      const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 60,
                            width: 80,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.1, color: Colors.amber),
                              boxShadow: [
                                BoxShadow(
                                  color: listcolors[0].first.withOpacity(0.4),
                                  blurRadius: 15,
                                  spreadRadius: 1,
                                  offset: const Offset(4, 4),
                                )
                              ],
                              gradient: LinearGradient(
                                colors: buttonColor[0],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomLeft,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(22),
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.bookmark_add_outlined,
                                color: whitecolor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 9.6.w,
                          ),
                          Container(
                            height: 60.h,
                            width: 250.w,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.3, color: Colors.amber),
                              boxShadow: [
                                BoxShadow(
                                  color: listcolors[0].first.withOpacity(0.4),
                                  blurRadius: 15,
                                  spreadRadius: 1,
                                  offset: const Offset(4, 4),
                                )
                              ],
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 110, 109, 109),
                                  Color.fromARGB(255, 44, 44, 44),
                                  Color.fromARGB(255, 54, 54, 54),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(22),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Add to bag',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
