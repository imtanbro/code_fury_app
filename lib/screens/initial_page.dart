import 'package:codefuryapp/Service/login_activity_database.dart';
import 'package:codefuryapp/Service/providers/custom_user.dart';
import 'package:codefuryapp/Service/user_services.dart';
import 'package:codefuryapp/screens/home_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'initial_loading_screen.dart';
import 'landing_page.dart';

class InitialPage extends StatefulWidget {

  static final screenName = "InitialPage";

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> with TickerProviderStateMixin{

  final _db = LoginActivityDatabase.instance;
  String _uid;
  final _firebaseAuth = FirebaseAuth.instance;
  bool kDatabaseInitialization;

  _getDatabase() async{

    Map<String, dynamic> _response = await _db.checkUserStatus();

    if(_response['status'] == true) {
      _uid = _response['uid'];
      final _user = UserServices();
      final userInfo = await _user.getUserFromFirestore(_uid);
      _firebaseAuth.currentUser;
      return userInfo;
    }
    else{
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {

    final _userProvider = Provider.of<CustomUser>(context);

    return FutureBuilder(
      future: _getDatabase(),
      builder: (context, snapshot){

        if(!(snapshot.hasData)) {
          return InitialLoadingScreen();
        }

        else if(snapshot.data == false){
          return LandingPage();
        }

        else {
          _userProvider.setDataFromMap(snapshot.data);
          return NavigationScreen();
        }
      },
    );
  }
}
