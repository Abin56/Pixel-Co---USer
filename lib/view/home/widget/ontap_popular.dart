import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixels_user/controller/Getx/getx.dart';

import 'package:pixels_user/main.dart';
import 'package:pixels_user/model/favourite_model.dart';
import 'package:pixels_user/model/userCartModel.dart';
import 'package:pixels_user/view/cart/buying_Items/buying_items.dart';
import 'package:pixels_user/view/cart/user_cart_screen/userCart_screen.dart';
import 'package:pixels_user/view/core/const.dart';
import 'package:pixels_user/view/home/widget/navigation_bar.dart';
import 'package:pixels_user/view/widget/buttonContainer_widget.dart';
import 'package:pixels_user/view/widget/newMorphism_black.dart';
import '../../colors/color.dart';

class OnTapPopular extends StatelessWidget {
  var image;
  var productname;
  double price;
  var discription;
  var id;

  OnTapPopular(
      {required this.image,
      required this.id,
      required this.discription,
      required this.price,
      required this.productname,
      super.key});
  final getxController = Get.put(PixelsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.offAll( NavigationBarContoller()),
                    child: ButtonContainerWidget(
                      colorindex: 0,
                      curving: 6,
                      height: 38.h,
                      width: 40,
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
            CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 120,
                backgroundImage: NetworkImage(image)),
            NewMorphismBlackWidget(
              height: 400.h,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productname,
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      price.toString(),
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
                    Text(
                      discription,
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final addDetails = UserFavtModel(
                                id: '',
                                productImage: image,
                                productName: productname,
                                price: price,
                                category: '',
                                quantity: 0,
                                discription: discription,
                                documentId: '',
                                available: true);
                            await AddUserFavProductToFireBase()
                                .addProductController(addDetails);
                          },
                          child: ButtonContainerWidget(
                            colorindex: 1,
                            curving: 30,
                            height: 60,
                            width: 80,
                            child: const Center(
                              child: Icon(
                                Icons.bookmark_add_outlined,
                                color: whitecolor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 9.6.w,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final productModel = UserCartProdutModel(
                                userID: FirebaseAuth.instance.currentUser!.uid,
                                id: id,
                                productImage: image,
                                productName: productname,
                                price: price,
                                category: '',
                                quantity: 1,
                                discription: discription,
                                documentId: '',
                                available: true);
                            UserCartProductToFireBase()
                                .addCartModelController(productModel);
                          },
                          child: ButtonContainerWidget(
                            colorindex: 0,
                            curving: 30,
                            height: 60.h,
                            width: 200.w,
                            child: const Center(
                              child: Text(
                                'Add to bag',
                                style: TextStyle(fontSize: 15),
                              ),
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
    );
  }
}
