// ignore_for_file: sort_child_properties_last, must_be_immutable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixels_user/controller/Getx/getx.dart';
import 'package:pixels_user/model/userCartModel.dart';
import 'package:pixels_user/view/cart/buying_Items/proceed_Checkout.dart';
import 'package:pixels_user/view/colors/color.dart';
import 'package:pixels_user/view/core/const.dart';
import 'package:pixels_user/view/home/widget/navigation_bar.dart';
import 'package:pixels_user/view/widget/buttonContainer_widget.dart';
import 'package:pixels_user/view/widget/newMorphism_black.dart';

class BuyingOrdersScreen extends StatelessWidget {
  var addressId;
  var id;
  BuyingOrdersScreen({this.addressId, this.id, super.key});

  final getxController = Get.put(PixelsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 44, 59),
      // backgroundColor: Colors.grey[900],
      body: SafeArea(
          child: GetBuilder<PixelsController>(
        init: getxController,
        id: 'Cart',
        initState: (_) {},
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder(
                stream: getxController.getProductStream(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<UserCartProdutModel>> snapshot) {
                  if (snapshot.hasData) {
                    getxController.totalAmount = 0;
                    for (var result in snapshot.data!) {
                      getxController.totalAmount +=
                          (result.price * result.quantity);
                    }
                    return ListView(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                getxController.newValue = 0;
                                Get.off(NavigationBarContoller());
                              },
                              child: ButtonContainerWidget(
                                curving: 8,
                                colorindex: 0,
                                height: 40,
                                width: 40,
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: whitecolor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            const Text(
                              "My Shopping Cart",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        sizedboxH,
                        SizedBox(
                          height: 350.h,
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                UserCartProdutModel data =
                                    snapshot.data![index];
                                //

                                //
                                return SizedBox(
                                  height: 110.h,
                                  child: Row(
                                    children: [
                                      NewMorphismBlackWidget(
                                        height: 86.h,
                                        width: 86.h,
                                        child: Container(
                                          height: 80.h,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      data.productImage))),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            data.productName,
                                            style:
                                                const TextStyle(fontSize: 17),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  'Price : ',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10),
                                                ),
                                                Text(
                                                  '${data.price}',
                                                  style: const TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 11),
                                                ),
                                                SizedBox(
                                                  width: 50.w,
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    await getxController
                                                        .increMentCount(data);
                                                  },
                                                  child: ButtonContainerWidget(
                                                      curving: 10,
                                                      child: const Center(
                                                          child: Icon(
                                                        Icons.add,
                                                        color: whitecolor,
                                                      )),
                                                      colorindex: 0,
                                                      height: 30.h,
                                                      width: 30.w),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Text('${data.quantity}'),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    if (data.quantity > 1) {
                                                      await getxController
                                                          .decrementCount(data);
                                                    } else {
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection(
                                                              "UserCartModel")
                                                          .doc(data.id)
                                                          .delete()
                                                          .then((value) =>
                                                              Get.snackbar(
                                                                  "Message",
                                                                  'Deleted',
                                                                  backgroundColor:
                                                                      Colors
                                                                          .red,
                                                                  colorText: Colors
                                                                      .white));
                                                    }
                                                  },
                                                  child: ButtonContainerWidget(
                                                      curving: 10,
                                                      child: const Center(
                                                          child: Icon(
                                                        Icons.remove,
                                                        color: whitecolor,
                                                      )),
                                                      colorindex: 4,
                                                      height: 30.h,
                                                      width: 30.w),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                                //
                              },
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  color: Colors.blue,
                                );
                              },
                              itemCount: snapshot.data?.length ?? 0),
                        ),
                        ProceedToCheckOut(
                            addressId: addressId,
                            getxController: getxController)
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.grey,
                      ),
                    );
                  }
                }),
          );
        },
      )),
    );
  }
}
