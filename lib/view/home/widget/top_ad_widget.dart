import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixels_user/model/allProdut__mode.dart';
import '../../colors/color.dart';

class TopAdWidget extends StatelessWidget {
  const TopAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("ProductList").snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            return CarouselSlider.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index, realIndex) {
                final data =
                    AllProductModel.fromJson(snapshot.data!.docs[index].data());
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  // height: 200.h,
                  width: 330.w,
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
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(22),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 140,
                          child: Container(
                            height: 180.h,
                            width: 180.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(data.productImage))),
                          ),
                        ),
                        const Positioned(
                          top: 20,
                          child: Text(
                            'New Vintage\nCollection',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                            top: 100,
                            left: 6,
                            child: Container(
                              height: 50,
                              width: 130,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 0.2, color: whitecolor),
                                boxShadow: [
                                  BoxShadow(
                                    color: listcolors[0].first.withOpacity(0.4),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                    offset: const Offset(4, 4),
                                  ),
                                  BoxShadow(
                                    color: blackcolor.withOpacity(0.4),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 4),
                                  )
                                ],
                                gradient: LinearGradient(
                                  colors: buttonColor[0],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(22),
                                ),
                              ),
                              child: const Center(child: Text("Explore now")),
                            ))
                      ],
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                  aspectRatio: 1.7,
                  viewportFraction: 2,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  // height: 300.h,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3)),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

builImage(urlImage, index) {}
