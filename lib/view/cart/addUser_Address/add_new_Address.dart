import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixels_user/model/userAddress.dart';
import 'package:pixels_user/view/colors/color.dart';
import 'package:pixels_user/view/widget/buttonContainer_widget.dart';

class AddNewDeliveryAddress extends StatelessWidget {
  final _userName = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _pinCode = TextEditingController();
  final _userAddress = TextEditingController();

  AddNewDeliveryAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TextFormField(
              controller: _userName,
              style: const TextStyle(color: whitecolor),
              decoration: const InputDecoration(
                  helperText: 'Enter full name',
                  isDense: true,
                  filled: true,
                  fillColor: Color.fromARGB(0, 16, 16, 16),
                  hintText: 'Name',
                  hintStyle: TextStyle(color: Colors.grey),
                  focusColor: whitecolor,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: whitecolor,
                    width: 1.0,
                  )))),
          TextFormField(
              keyboardType: TextInputType.number,
              controller: _phoneNumber,
              style: const TextStyle(color: whitecolor),
              decoration: const InputDecoration(
                  helperText: 'PhoneNumber',
                  isDense: true,
                  filled: true,
                  fillColor: Color.fromARGB(0, 16, 16, 16),
                  hintText: 'PhoneNumber',
                  hintStyle: TextStyle(color: Colors.grey),
                  focusColor: whitecolor,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: whitecolor,
                    width: 1.0,
                  )))),
          TextFormField(
              keyboardType: TextInputType.number,
              controller: _pinCode,
              style: const TextStyle(color: whitecolor),
              decoration: const InputDecoration(
                  helperText: 'Enter PinCode',
                  hintText: ' PinCode',
                  isDense: true,
                  filled: true,
                  fillColor: Color.fromARGB(0, 16, 16, 16),
                  hintStyle: TextStyle(color: Colors.grey),
                  focusColor: whitecolor,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: whitecolor,
                    width: 1.0,
                  )))),
          TextFormField(
            controller: _userAddress,
            style: const TextStyle(color: whitecolor),
            decoration: const InputDecoration(
              helperText: 'Enter Perment Address',
              isDense: true,
              filled: true,
              fillColor: Color.fromARGB(0, 16, 16, 16),
              hintText: 'Address',
              hintStyle: TextStyle(color: Colors.grey),
              focusColor: whitecolor,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: whitecolor,
                  width: 1.0,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              final String name = _userName.text.trim();
              final String phoneNumber = _phoneNumber.text.toString().trim();
              final String pinCode = _phoneNumber.text.toString().trim();
              final String address = _userAddress.text.toString();
              final _addTofireBase = UserAddressModel(
                  id: '',
                  uid: FirebaseAuth.instance.currentUser!.uid,
                  userName: name,
                  phoneNumber: phoneNumber,
                  pinCode: pinCode,
                  userAddress: address);
              UserAddressAddToFireBase()
                  .addUserAddressModelController(_addTofireBase);
            },
            child: ButtonContainerWidget(
              curving: 30,
              colorindex: 4,
              height: 80.h,
              width: 200.w,
              child: const Center(
                child: Text(
                  'Save Address',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
