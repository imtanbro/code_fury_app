import 'package:codefuryapp/Employee/Screens/ApplicationStatus/application_status.dart';
import 'package:codefuryapp/Employee/Screens/JobList/job_list.dart';
import 'package:codefuryapp/Employee/Screens/Profile/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  static String id ='home';
  @override
  _HomeState createState() => _HomeState();
}
List <Widget> currRoute =[JobList(),ApplicationStatus(),ProfileApplicant()];
int cindex =1;
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
        index: cindex,
        animationDuration: Duration(milliseconds: 200),
        onTap:(index){
          setState(() {
            cindex=index;
            print(cindex);
          });
        },
        height: 50,
      ),
      body:currRoute[cindex],
    );
  }
}


// List <Widget> currRoute =[JobList(),ApplicationStatus(),ProfileApplicant()];