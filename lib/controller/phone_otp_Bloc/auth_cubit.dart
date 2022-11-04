import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pixels_user/controller/phone_otp_Bloc/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  //
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //

  AuthCubit() : super(AuthInitialState()) {
    //
    User? currentUser = _auth.currentUser;
    //
    if (currentUser != null) {
      // Logged IN>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      emit(AuthLoggedInState(currentUser));
    } else {
      //Logged out >>>>>>>>>>>>>>>>>>>>>>>>
      emit(AuthLoggedOutState());
    }
  }

  //
  String? _verificationId;

  void sentOTP(String phoneNumber) async {
    emit(AuthLoadingState());
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        codeSent: (verificationId, forceResendingToken) {
          _verificationId = verificationId;

          emit(AuthCodeSentState());
        },
        //
        verificationCompleted: (phoneAuthCredential) {
          signInWithPhone(phoneAuthCredential);
        },
        //
        verificationFailed: (error) {
          emit(AuthErrorState(error.message.toString()));
        },
        //
        codeAutoRetrievalTimeout: (verficationId) {
          _verificationId = verficationId;
        });
    //
  }

  void verifyOTP(String otp) async {
    emit(AuthLoadingState());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: otp);
    signInWithPhone(credential);
  }

  void signInWithPhone(PhoneAuthCredential credential) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        emit(AuthLoggedInState(userCredential.user!));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorState(e.message.toString()));
    }
  }

  void logOut() async {
    await _auth.signOut();
    emit(AuthLoggedOutState());
  }
}
