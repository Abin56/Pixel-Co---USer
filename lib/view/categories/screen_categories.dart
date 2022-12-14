import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:pixels_user/controller/Getx/getx.dart';
import 'package:pixels_user/view/categories/category_itemDisplay.dart';
import 'package:pixels_user/view/widget/newMorphism_black.dart';

class ScreenCategories extends StatelessWidget {
  ScreenCategories({super.key});
  final getxController = Get.put(PixelsController());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    int columnCount = 2;
    return GetBuilder<PixelsController>(
      init: getxController,
      initState: (_) {},
      builder: (_) {
        return getxController.list1.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              )
            : FutureBuilder(
                future: getxController.fetchingCategory(),
                builder: (context,
                    AsyncSnapshot<List<Map<String, dynamic>>> snapsshot) {
                  if (snapsshot.hasData) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text("Categories"),
                        backgroundColor: const Color.fromARGB(255, 36, 44, 59),
                      ),
                      body: SafeArea(
                        child: AnimationLimiter(
                          child: GridView.count(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            padding: EdgeInsets.all(w / 60),
                            crossAxisCount: columnCount,
                            children: List.generate(
                              snapsshot.data!.length,
                              (int index) {
                                final data = snapsshot.data![index];

                                //
                                final categories =
                                    snapsshot.data![index]['CategoryName'];

                                //
                                log(categories.toString());
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
                                              onTap: () async {
                                                Get.to(CategotyItemDisplay(
                                                  categoryID: categories,
                                                ));
                                              },
                                              child: NewMorphismBlackWidget(
                                                height: 200,
                                                width: double.infinity,
                                                child: Center(
                                                  child: Text(
                                                    snapsshot.data![index]
                                                        .values.first,
                                                  ),
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
                });
      },
    );
  }
}
