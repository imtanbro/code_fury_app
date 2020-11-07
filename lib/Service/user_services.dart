

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codefuryapp/Service/providers/custom_user.dart';
import 'package:codefuryapp/helpers/constants.dart';

class UserServices {

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  createUserOnFirestore(CustomUser user) async{
    await _firestore.collection('user').doc(user.uid).set({
      'uid' : user.uid,
      'phoneNumber' : user.phoneNumber,
      'name' : user.name,
      'email': user.email,
      'adhaarNumber': user.adhaarNo,
      'panNumber': user.panNo,
      'profileURL': defaultProfileURL,
      'role': user.role,
    });
  }

  Future<Map<String, dynamic>> getUserFromFirestore(String uid) async{
    try {
      DocumentSnapshot _document = await _firestore.collection('users').doc(uid).get();
      return _document.data();
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }
}