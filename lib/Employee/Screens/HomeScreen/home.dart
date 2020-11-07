import 'package:codefuryapp/Employers/screens/home_screens.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static String id ='home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  CurvedNavigationBar(
        items: <Widget>[
          Icon(Icons.list, size: 30),
          Icon(Icons.add_comment, size: 30),
          Icon(Icons.business, size: 30),
        ],
        backgroundColor:Colors.white,
        color:Colors.blue ,
        buttonBackgroundColor:Colors.white ,
        index: currIndex,
        animationDuration: Duration(milliseconds: 200),
        onTap:(index){
          setState(() {
            currIndex=index;
            print(currIndex);
          });
        },
        height: 50,
      ),
      body:currWid[currIndex],
    );
  }
}