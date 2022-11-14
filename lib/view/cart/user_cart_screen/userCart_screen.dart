// ignore_for_file: file_names, must_be_immutable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixels_user/model/favourite_model.dart';
import 'package:pixels_user/model/userCartModel.dart';
import 'package:pixels_user/view/core/const.dart';
import 'package:pixels_user/view/widget/buttonContainer_widget.dart';
import 'package:pixels_user/view/widget/newMorphism_black.dart';

class UserCartScreen extends StatelessWidget {
  UserCartScreen({required this.id, super.key});
  String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Cart"),
        ),
        body: SafeArea(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("UserFavourtiesProduct")
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      final data = UserFavtModel.fromJson(
                          snapshot.data!.docs[index].data());
                      return NewMorphismBlackWidget(
                        height: 200.h,
                        width: double.infinity.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      NetworkImage(data.productImage),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      data.productName,
                                      style: TextStyle(fontSize: 30),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Price : ",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        Text(
                                          data.price.toString(),
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await removeFavProduct(data.id);
                                  },
                                  child: ButtonContainerWidget(
                                    curving: 30,
                                    colorindex: 1,
                                    height: 50.h,
                                    width: 130.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          'Remove',
                                          style: TextStyle(fontSize: 13),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    final productModel = UserCartProdutModel(
                                      userID: FirebaseAuth.instance.currentUser!.uid,
                                        id: id,
                                        productImage: data.productImage,
                                        productName: data.productName,
                                        price:data.price,
                                        category: data.category,
                                        quantity: 1,
                                        discription: data.discription,
                                        documentId: data.documentId,
                                        available: true);
                                    UserCartProductToFireBase()
                                        .addCartModelController(productModel);
                                  },
                                  child: ButtonContainerWidget(
                                    colorindex: 0,
                                    curving: 30,
                                    height: 50.h,
                                    width: 130.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        Icon(
                                          Icons.flash_on_outlined,
                                          color: Colors.amber,
                                        ),
                                        Text(
                                          'Buy Now',
                                          style: TextStyle(fontSize: 13),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return sizedboxH;
                    },
                    itemCount: snapshot.data!.docs.length);
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ),
                );
              }
            },
          ),
        ));
  }

  Future removeFavProduct(String id) async {
    await FirebaseFirestore.instance
        .collection("UserFavourtiesProduct")
        .doc(id)
        .delete();
    // .then((value) => Fluttertoast.showToast(msg: "Removed From Cart"));
  }
}
