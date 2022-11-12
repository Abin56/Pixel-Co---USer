import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixels_user/model/allProdut__mode.dart';
import 'package:pixels_user/view/home/widget/ontap_popular.dart';
import 'package:pixels_user/view/widget/newMorphism_black.dart';
import '../../colors/color.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("AllProducts").snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              height: 500.h,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 15,
                childAspectRatio: 1 / 1.3,
                shrinkWrap: true,
                children: List.generate(
                  snapshot.data!.docs.length,
                  (index) {
                    final data = AllProductModel.fromJson(
                        snapshot.data!.docs[index].data());
                    return GestureDetector(
                      onTap: () => Get.to(OnTapPopular(id: data.id,
                  
                          image: data.productImage,
                          discription: data.discription,
                          price: double.parse(data.price),
                          productname: data.productName)),
                      child: NewMorphismBlackWidget(
                        height: 100,
                        width: 100,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 56,
                                    backgroundImage:
                                        NetworkImage(data.productImage),
                                  ),
                                  Text(
                                    data.productName,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    data.price,
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 88, 161, 222),
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
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

  BoxDecoration glassMorphism() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
          width: 0.2,
          color: const Color.fromARGB(255, 56, 159, 244).withOpacity(0.9)),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        colors: [whitecolor.withOpacity(0.10), whitecolor.withOpacity(0.10)],
      ),
    );
  }
}

BoxDecoration glassMorphism() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(width: 0.2, color: whitecolor),
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomCenter,
      colors: [whitecolor.withOpacity(0.10), whitecolor.withOpacity(0.10)],
    ),
  );
}


//

//