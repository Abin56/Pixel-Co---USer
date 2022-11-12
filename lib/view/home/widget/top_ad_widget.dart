import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixels_user/model/offerProdut_model.dart';
import 'package:pixels_user/view/home/widget/ontap_popular.dart';
import 'package:pixels_user/view/widget/buttonContainer_widget.dart';
import 'package:pixels_user/view/widget/newMorphism_black.dart';

import '../../../controller/Getx/getx.dart';

class TopAdWidget extends StatelessWidget {
  TopAdWidget({super.key});
  final getxController = Get.put(PixelsController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("OfferProduts").snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            return CarouselSlider.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index, realInde) {
                final data = OfferProductModel.fromJson(
                    snapshot.data!.docs[index].data());

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
                            left: 146,
                            child: Container(
                              height: 185.h,
                              width: 185.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(data.productImage))),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            child: Text(
                              data.productName,
                              style: const TextStyle(
                                  fontSize: 29, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                            top: 58,
                            child: Row(
                              children: [
                                Text(
                                  "Get ",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  data.offerPercentage,
                                  style: const TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  " % OFF",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              top: 100,
                              left: 6,
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(OnTapPopular(
                                      id: data.id,
                                      image: data.productImage,
                                      discription: data.discription,
                                      price: double.parse(data.price),
                                      productname: data.productName));
                                },
                                child: ButtonContainerWidget(
                                  colorindex: 0,
                                  curving: 10,
                                  height: 50,
                                  width: 130,
                                  child:
                                      const Center(child: Text("Explore now")),
                                ),
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
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            );
          }
        });
  }
}
