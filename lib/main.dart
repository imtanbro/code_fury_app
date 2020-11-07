import 'package:codefuryapp/Employee/Screens/Registration.dart';
import 'package:codefuryapp/Service/Login/login.dart';
import 'package:flutter/material.dart';
import 'screens/home_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SelectPart(),
    );
  }
}

// NavigationScreen()

class SelectPart extends StatefulWidget {
  @override
  _SelectPartState createState() => _SelectPartState();
}

class _SelectPartState extends State<SelectPart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Container(
                height: 200,
                width: (MediaQuery.of(context).size.width / 2) - 25,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.black.withOpacity(0.5)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 68, horizontal: 10),
                      child: Text("Looking for Job",
                          style: TextStyle(
                            fontSize: 25,
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NavigationScreen()));
                },
                child: Container(
                  height: 200,
                  width: (MediaQuery.of(context).size.width / 2) - 25,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blue, Colors.black.withOpacity(0.5)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 68, horizontal: 10),
                        child: Text("Creating Opportunities",
                            style: TextStyle(
                              fontSize: 25,
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
