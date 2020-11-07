

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login_activity_database.dart';

class Authenticate with ChangeNotifier{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _db = LoginActivityDatabase.instance;
  String verificationID;
  String error;
  bool flag = false;

  // TODO: IMPLEMENT SEPARATE ERROR MESSAGE BASED ON ERROR CODE IN EACH FUNCTION.

  Future sendOTP(String phoneNumber) async{

    ///This function does not return any value. It updates the phoneVerificationResponse which looks like:
    ///{
    ///   'error' : null(if no error) or errorMessage,
    ///   'verificationID': null(if there is an error) or verificationID which is used for verification of the OTP.
    ///}
    ///We use notifyListeners() to update the value in our UI as well.
    ///This also updates flag to reflect changes in the UI.

    phoneNumber = phoneNumber.trim();
    if(phoneNumber.substring(0,3) != '+91'){
      phoneNumber = '+91' + phoneNumber;
      print(phoneNumber);
    }

    try {
      final PhoneVerificationCompleted verificationCompleted = (AuthCredential phoneCredential) {
        print('No need to verify using otp');
      };

      final PhoneVerificationFailed verificationFailed = (FirebaseAuthException authException) {
        print('Verification Failed. Code: ${authException.code}, message: ${authException.message}');
        this.error = authException.message;
        notifyListeners();

      };

      final PhoneCodeSent codeSent = (String verificationID, [int forceResendingToken]) {
        print('Phone code sent: ' + verificationID);
        print('Please check your phone for the verification code.');
        this.verificationID = verificationID;
        flag = true;
        Fluttertoast.showToast(msg: 'OTP Successfully Sent!');
        notifyListeners();
      };

      final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (String verificationID){
        print('codeAutoRetrivealTimeout: ' + verificationID);
      };

      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 10),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    }
    catch(e){
      this.error = e.toString();
      notifyListeners();
    }
  }

  Future<Map<String, String>> verifyPhoneNumber(String otp, String verificationOTP) async{

    ///This function returns a Future<Map<String, String>> in such format:
    ///{
    ///   'error' : null(if no error) or errorMessage,
    ///   'uid': null(if there is an error) or user uid.
    ///}
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationOTP,
        smsCode: otp,
      );
      final User user =
          (await _firebaseAuth.signInWithCredential(credential)).user;
      final User currentUser =  _firebaseAuth.currentUser;
      assert(user.uid == currentUser.uid);
      if (user != null) {
        return {
          'error': null,
          'uid': user.uid,
        };
      }
      else {
        return {
          'error': 'Sign-in Failed',
          'uid': null,
        };
      }
    }
    catch (e) {
      return {
        'error': e.toString(),
        'uid': null,
      };
    }
  }

  Future<Map<String, String>> createAccountUsingEmail(String email, String password) async{

    ///Returns a Future<Map<String,String>> in such format:
    ///{
    ///   'error': null(if there is no error) or error
    ///   'uid': null(if there is an error) or user.user.uid
    ///}

    try{
      final user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      print(user.user.uid);
      return {
        'error': null,
        'uid': user.user.uid,
      };
    }
    catch(e) {
      print(e.toString());
      return {
        'error': e.toString(),
        'uid': null,
      };
    }
  }

  Future<Map<String, String>> signInUsingEmailID(String email, String password) async{

    ///Returns a Future<Map<String,String>> in such format:
    ///{
    ///   'error': null(if there is no error) or error
    ///   'uid': null(if there is an error) or user.user.uid
    ///}

    try{
      final user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return {
        'error': null,
        'uid': user.user.uid,
      };
    }
    catch(e){
      print(e.toString());
      return {
        'error': e.toString(),
        'uid': null,
      };
    }
  }


  forgotPassword(String email) async {
    try{
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    }
    catch(e) {
      print(e.toString());
    }
  }

  signOutUser(String uid) async{
    await _firebaseAuth.signOut();
    await _db.delete(uid);
  }

  getCurrentUser() async {
    User _firebaseUser =  _firebaseAuth.currentUser;
    print('*******************${_firebaseUser.uid}');
  }
}