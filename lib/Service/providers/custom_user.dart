

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codefuryapp/Service/login_activity_database.dart';
import 'package:flutter/foundation.dart';

class CustomUser extends ChangeNotifier {

  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  String _phoneNumber;
  String _name;
  String _email;
  String _uid;
  String _panNumber;
  String _adhaarNumber;
  String _role;

  set phoneNumber(phoneNumber) => _phoneNumber = phoneNumber;
  set name(name) => _name = name;
  set email(email) => _email = email;
  set uid(uid) => _uid = uid;
  set panNumber(houseFlatNumber) => _panNumber = houseFlatNumber;
  set adhaarNumber(societyLocalityName) => _adhaarNumber = societyLocalityName;
  set role(role) => _role = role;

  String get phoneNumber => _phoneNumber;
  String get name => _name;
  String get email => _email;
  String get uid => _uid;
  String get panNo => _panNumber;
  String get adhaarNo => _adhaarNumber;
  String get role => _role;

  setDataFromMap(Map<String, dynamic> userInfo) {

  }

  getUserFromFirestore(String uid) async {
    try {
      DocumentSnapshot _document = await _firebaseFirestore.collection('users').doc(uid).get();
      print('Get User: ${_document.data}');
      String role = _document.data()['role'];
      LoginActivityDatabase _db = LoginActivityDatabase.instance;
      _db.insert({
        LoginActivityDatabase.columnName1: uid,
        LoginActivityDatabase.columnName2: role,
      });
      setDataFromMap(_document.data());
    }
    catch(e) {
      print(e.toString());
    }
  }
}