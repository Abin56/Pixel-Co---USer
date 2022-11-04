import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixels_user/view/home/widget/ontap_popular.dart';


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
              child: BoxDecorationWidget(
                height: 100,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Canon EOS 30 D',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "16000",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


//

//