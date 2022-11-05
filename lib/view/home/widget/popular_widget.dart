import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixels_user/view/home/widget/ontap_popular.dart';
import 'package:pixels_user/view/widget/newMorphism_black.dart';

import '../../colors/color.dart';
import '../../widget/boxdecoration_widget.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 15,
        childAspectRatio: 1 / 1.3,
        shrinkWrap: true,
        children: List.generate(
          20,
          (index) {
            return GestureDetector(
              onTap: () => Get.to(const OnTapPopular()),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 56,
                            backgroundImage:
                                AssetImage('assest/Images/png_camera.png'),
                          ),
                          Text(
                            'Canon EOS 30 D',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "16000",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
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
  }

  BoxDecoration glassMorphism() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
          width: 0.2,
          color: Color.fromARGB(255, 56, 159, 244).withOpacity(0.9)),
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