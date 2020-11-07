import 'package:flutter/material.dart';
import 'my_profile/company_home.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(
        appBar: AppBar(
          title: Text('My Profile',
            style: TextStyle(
                color: Colors.white
            ),
          ) ,
          backgroundColor: Colors.blue,
        ),
        body: MyProfileHome(),
      ),
    );
  }
}
