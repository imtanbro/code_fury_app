import 'package:flutter/material.dart';
import 'job_screen.dart';
import 'profile.dart';
import 'application_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';



class NavigationScreen extends StatefulWidget {
  static String id ='home';
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}
List <Widget> currWid = [
  Applicants(),
  Job(),
  MyProfile(),
];
int currIndex =0;
class _NavigationScreenState extends State<NavigationScreen> {

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
