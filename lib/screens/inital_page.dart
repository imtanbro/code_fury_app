import 'package:codefuryapp/Service/authentication.dart';
import 'package:codefuryapp/Service/providers/custom_user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'initial_page.dart';


class InitialState extends StatefulWidget {

  static final screeName = "Initialization";

  @override
  _InitialStateState createState() => _InitialStateState();
}

class _InitialStateState extends State<InitialState> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
      future: Firebase.initializeApp(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return MultiProvider(
              providers: [
                ChangeNotifierProvider<CustomUser>(
                  create: (context){
                    return CustomUser();
                  },
                ),
                ChangeNotifierProvider<Authenticate>(
                  create: (context) {
                    return Authenticate();
                  },
                ),
              ],

              child:Consumer2<CustomUser, Authenticate>(
                builder: (context, user, authenticate, child){
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      primaryColor: Color(0xFF00ff7f),
                    ),
                    home: InitialPage(),
                  );
                },
              )
          );
        }
        else {
          return Container(
            height: 75,
            width: 75,
            child: CircularProgressIndicator(),
          );
        }
      },
    );

  }
}
