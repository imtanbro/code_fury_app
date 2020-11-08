import 'package:flutter/material.dart';

class StatusofApplication extends StatefulWidget {
  @override
  _StatusofApplicationState createState() => _StatusofApplicationState();
}

class _StatusofApplicationState extends State<StatusofApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Job title"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                ),
                Positioned(
                  top: 20,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [],
                    ),
                  ),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Title",
                  style: TextStyle(fontSize: 27),
                )),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Discription",
                  style: TextStyle(fontSize: 27),
                )),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Location",
                  style: TextStyle(fontSize: 27),
                )),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Duration",
                  style: TextStyle(fontSize: 27),
                )),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Status",
                  style: TextStyle(fontSize: 27),
                )), 
          ],
        ),
      ),
    );
  }
}
