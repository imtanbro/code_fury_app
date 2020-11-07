import 'dart:js';

import 'package:codefuryapp/Employee/Screens/Registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  Stream<User> get authStateChanges => _auth.authStateChanges();

  // Future<bool> loginPhone(String phone) async {
  //   await _auth.verifyPhoneNumber(
  //       phoneNumber: phone,
  //       timeout: Duration(seconds: 60),
  //       verificationCompleted: (AuthCredential credential) async {
  //         await _auth.signInWithCredential(credential);
  //         User user = (await _auth.signInWithCredential(credential)).user; 
  //       },
  //       verificationFailed: null,
  //       codeSent: null,
  //       codeAutoRetrievalTimeout: null);
  // }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<String> signIn({String email, String pass}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: pass);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<String> signUp({String email, String pass}) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: pass);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
