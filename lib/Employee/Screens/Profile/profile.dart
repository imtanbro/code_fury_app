import 'package:flutter/material.dart';

class ProfileApplicant extends StatefulWidget {
  @override
  _ProfileApplicantState createState() => _ProfileApplicantState();
}

class _ProfileApplicantState extends State<ProfileApplicant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.edit),
          ),
        ],),
          body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  maxRadius: 50,
                  backgroundColor: Colors.blue,
                  //background image use karle company ka image
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Name',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold ,
                    color: Colors.black
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Pan Details :',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text('Pan Number',
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(
              height: 15,
            ),

            
            Text(
              'Adhar Details :',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text('Adhar Number',
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(
              height: 15,
            ),

            Text(
              'Address :',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text('Entire Address along with State and City.',
              style: TextStyle(
                fontSize: 20
              ),
            ),

             SizedBox(
              height: 15,
            ),

            Text(
              'Email Address :',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text('Email',
              style: TextStyle(
                fontSize: 20
              ),
            ),
          ],
        ),
      ),
    );
  }
}