import 'package:carousel_slider/carousel_slider.dart';
import 'package:codefuryapp/Employee/Screens/ApplicationStatus/statusandchat.dart';
import 'package:flutter/material.dart';

class ApplicationStatus extends StatefulWidget {
  @override
  _ApplicationStatusState createState() => _ApplicationStatusState();
}

class _ApplicationStatusState extends State<ApplicationStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application Status"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
                onTap: () {
                  print("Tapped on app bar logout button");
                  return null;
                },
                child: Icon(Icons.logout)),
          )
        ],
      ),
      body: ListView(children: [
        GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StatusofApplication()));
          },
          child: Container(
            width: 300,
            height: 180,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(76, 161, 175, 1),
                  Color.fromRGBO(196, 224, 229, 1)
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Title",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Job Discription",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
                Text(
                  "Number of Opening",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
                Text(
                  "Closing Date",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StatusofApplication()));
          },
          child: Container(
            width: 300,
            height: 180,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(76, 161, 175, 1),
                  Color.fromRGBO(196, 224, 229, 1)
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Title",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Job Discription",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
                Text(
                  "Number of Opening",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
                Text(
                  "Closing Date",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
