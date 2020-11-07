import 'package:codefuryapp/screens/registration_screen_one.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF009FFD),
                  Color(0xFF2A2A72),
                ]
            )
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'JobKart',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 36.0,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('images/logo.png'),
                      height: 300,
                      width: 300,
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 12.0),
                    child: RaisedButton(
                      color: Colors.white,
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                        print('Login');
                      },
                      child: Text(
                        'Login',
                        style: GoogleFonts.lato(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 12.0),
                    child: RaisedButton(
                      color: Colors.white,
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistrationScreen()));
                        print('Register');
                      },
                      child: Text(
                        'Register',
                        style: GoogleFonts.lato(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
