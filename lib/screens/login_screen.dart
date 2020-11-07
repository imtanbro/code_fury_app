import 'package:codefuryapp/Service/authentication.dart';
import 'package:codefuryapp/Service/providers/custom_user.dart';
import 'package:codefuryapp/components/error_alert_dialog.dart';
import 'package:codefuryapp/Employers/home_screens.dart';
import 'package:codefuryapp/screens/registration_screen_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin{

  final _formKey = GlobalKey<FormState>();
  final _resetPasswordKey = GlobalKey<FormState>();
  bool _loadingFlag = true;
  String _email;
  String _password;


  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<Authenticate>(context, listen: true);
    final _userProvider = Provider.of<CustomUser>(context, listen: false);
    return Builder(
      builder: (context) {
        return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF009FFD),
                    Color(0xFF2A2A72),
                  ]
                )
              ),
              child: _loadingFlag ? Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                                border: Border.all(color: Colors.white),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Sign In',
                                        style: GoogleFonts.pacifico(
                                          color: Colors.white,
                                          fontSize: 27,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Divider(
                                        color: Colors.white,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(18.0)),
                                            color: Colors.white,
                                            border: Border.all(color: Colors.white),
                                          ),
                                          child: TextFormField(
                                            validator: (email){
                                              if(email.length == 0) {
                                                return 'Please enter your mail id.';
                                              }
                                              return null;
                                            },
                                            onChanged: (email) {
                                              _email = email;
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'Please enter your mail id.',
                                              hintText: 'Email ID',
                                              labelStyle: GoogleFonts.lato(
                                                  color: Colors.grey
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                                                borderSide: BorderSide(width: 0.0, color: Colors.white),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                                                borderSide: BorderSide(width: 0.0, color: Colors.white),
                                              ),
                                              disabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                                                borderSide: BorderSide(width: 0.0, color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(18.0)),
                                            color: Colors.white,
                                            border: Border.all(color: Colors.white),
                                          ),
                                          child: TextFormField(
                                            validator: (password){
                                              if(password.length == 0) {
                                                return 'Please enter your password.';
                                              }
                                              return null;
                                            },
                                            onChanged: (password) {
                                              _password = password;
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'Please enter your password.',
                                              hintText: 'Password',
                                              labelStyle: GoogleFonts.lato(
                                                color: Colors.grey,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                                                borderSide: BorderSide(width: 0.0, color: Colors.white),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                                                borderSide: BorderSide(width: 0.0, color: Colors.white),
                                              ),
                                              disabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                                                borderSide: BorderSide(width: 0.0, color: Colors.white),
                                              ),
                                            ),
                                            obscureText: true,
                                          ),
                                        ),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                                        child: RaisedButton(
                                          child: Text(
                                            'Sign-In',
                                            style: GoogleFonts.lato(),
                                          ),
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
                                          onPressed: () async{
                                            setState(() {
                                              _loadingFlag = false;
                                            });
                                            Map<String, String> _signInResponse = await _authProvider.signInUsingEmailID(_email, _password);
                                            setState(() {
                                              _loadingFlag = true;
                                            });
                                            if(_signInResponse['error'] == null) {
                                              setState(() {
                                                _loadingFlag = false;
                                              });
                                              await _userProvider.getUserFromFirestore(_signInResponse['uid']);
                                              setState(() {
                                                _loadingFlag = true;
                                              });
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => NavigationScreen(),
                                                ),
                                              );
                                            }
                                            else{
                                              showDialog(
                                                context: context,
                                                child: ErrorAlertDialog(
                                                  title: 'Verification Failed',
                                                  error: _signInResponse['error'],
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                      InkWell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Text(
                                              'Forgot Password',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                          ),
                                        ),
                                        onTap: (){
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text('Reset Password'),
                                                  content: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: <Widget>[
                                                      Form(
                                                        key: _resetPasswordKey,
                                                        child: TextFormField(
                                                          validator: (email){
                                                            if(email.length == 0) {
                                                              return 'Please enter your mail id.';
                                                            }
                                                            return null;
                                                          },
                                                          onChanged: (email) {
                                                            _email = email;
                                                          },
                                                          decoration: InputDecoration(
                                                            labelText: 'Please enter your mail id.',
                                                            hintText: 'Email ID',
                                                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.all(8.0),
                                                        child: Text(
                                                          'The link to reset password will be sent on this mail id.',
                                                          style: TextStyle(
                                                              fontStyle: FontStyle.italic
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  actions: <Widget>[
                                                    FlatButton(
                                                      onPressed: (){
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('Cancel'),
                                                    ),
                                                    FlatButton(
                                                      onPressed: () async{
                                                        try {
                                                          if(_resetPasswordKey.currentState.validate()) {
                                                            await _authProvider.forgotPassword(_email);
                                                          }
                                                        } catch (e) {
                                                          print(e.toString());
                                                        }

                                                      },
                                                      child: Text('Confirm'),
                                                    )
                                                  ],
                                                );
                                              }
                                          );
                                        },
                                      ),
                                      InkWell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Text(
                                              'New User?',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                          ),
                                        ),
                                        onTap: (){
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context)=>RegistrationScreen(),
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ) :
              Center(
                  child: SpinKitWave(
                    color: Colors.white,
                    size: 50.0,
                    controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
                  )
              ),
            )
        );
      },
    );
  }
}

