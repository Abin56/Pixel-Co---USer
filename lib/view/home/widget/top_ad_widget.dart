import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixels_user/model/allProdut__mode.dart';
import 'package:pixels_user/view/widget/buttonContainer_widget.dart';
import 'package:pixels_user/view/widget/newMorphism_black.dart';
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
                return NewMorphismBlackWidget(
                  height: 100.h,
                  width: 345.w,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
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
                              child: ButtonContainerWidget(
                                colorindex: 0,
                                curving: 10,
                                height: 50,
                                width: 130,
                                child: const Center(child: Text("Explore now")),
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                  aspectRatio: 1.6,
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
