import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pixels_user/view/widget/newMorphism_black.dart';

class ScreenCategories extends StatelessWidget {
  const ScreenCategories({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    int columnCount = 2;
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
              10,
              (int index) {
                //

                //
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  columnCount: columnCount,
                  child: ScaleAnimation(
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.fastLinearToSlowEaseIn,
                    scale: 1.8,
                    child: FadeInAnimation(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () async {},
                            child: NewMorphismBlackWidget(
                              height: 200,
                              width: double.infinity,
                              child: const Center(
                                child: Text('Categories'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
