import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child:Scaffold(
          appBar: AppBar(
            title: Text('Profile',
              style: TextStyle(
                  color: Colors.white
              ),
            ) ,
            backgroundColor: Colors.blue,
          ),
        )
    );
  }
}
