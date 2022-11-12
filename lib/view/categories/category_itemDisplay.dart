import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:pixels_user/controller/Getx/getx.dart';
import 'package:pixels_user/view/widget/buttonContainer_widget.dart';
import '../../model/allProdut__mode.dart';

class CategotyItemDisplay extends StatelessWidget {
  var categoryID;
  CategotyItemDisplay({required this.categoryID, super.key});

  final getxController = Get.put(PixelsController());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    int columnCount = 2;
    return GetBuilder<PixelsController>(
      init: getxController,
      initState: (_) {},
      builder: (_) {
        return getxController.categoryCollections.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              )
            : StreamBuilder(
                stream: getxController.getProduct(categoryID),
                builder:
                    (context, AsyncSnapshot<List<AllProductModel>> snapshot) {
                  if (snapshot.hasData) {
                    return Scaffold(
                      body: SafeArea(
                        child: AnimationLimiter(
                          child: GridView.count(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            padding: EdgeInsets.all(w / 60),
                            crossAxisCount: 2,
                            children: List.generate(
                              snapshot.data!.length,
                              (int index) {
                                //
                                final data = snapshot.data![index];
                                log(data.toString());

                                //
                                return AnimationConfiguration.staggeredGrid(
                                    position: index,
                                    duration: const Duration(milliseconds: 500),
                                    columnCount: columnCount,
                                    child: ScaleAnimation(
                                      duration:
                                          const Duration(milliseconds: 700),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      scale: 1.8,
                                      child: FadeInAnimation(
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () async {},
                                              child: ButtonContainerWidget(
                                                curving: 30,
                                                colorindex: 0,
                                                height: 300,
                                                width: double.infinity,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      radius: 45,
                                                      backgroundImage:
                                                          NetworkImage(data
                                                              .productImage),
                                                    ),
                                                    Text(
                                                      data.productName,
                                                      style: const TextStyle(
                                                          fontSize: 16),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ));
                              },
                            ),
                          ),
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
                },
              );
      },
    );
  }
}
