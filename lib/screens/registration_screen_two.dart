import 'package:codefuryapp/Service/authentication.dart';
import 'package:codefuryapp/Service/login_activity_database.dart';
import 'package:codefuryapp/Service/providers/custom_user.dart';
import 'package:codefuryapp/Service/user_services.dart';
import 'package:codefuryapp/components/error_alert_dialog.dart';
import 'package:codefuryapp/Employers/home_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class RegistrationScreenTwo extends StatefulWidget {

  final String role;

  RegistrationScreenTwo({
    @required this.role
  });

  @override
  _RegistrationScreenTwoState createState() => _RegistrationScreenTwoState();
}

class _RegistrationScreenTwoState extends State<RegistrationScreenTwo> with TickerProviderStateMixin{

  final _formKey = GlobalKey<FormState>();
  final _userServices = UserServices();
  String _password;
  String _confirmPassword;
  String _email;
  final _db = LoginActivityDatabase.instance;
  bool _isLoading = true;
  String _adhaarNumber;
  String _panNumber;

  @override
  Widget build(BuildContext context) {
    final _authenticateProvider = Provider.of<Authenticate>(context, listen: true);
    final _userProvider = Provider.of<CustomUser>(context, listen: true);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF009FFD),
              Color(0xFF2A2A72),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: SingleChildScrollView(
            child: _isLoading ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Fill Details',
                    style: GoogleFonts.lato(
                      fontSize: 33.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(18.0)),
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                          ),
                          child: TextFormField(
                            validator: (value){
                              if(value.length == 0) {
                                return 'This field cannot be empty';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              _adhaarNumber = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'Adhaar Number',
                              hintText: 'Adhaar Number',
                              labelStyle: GoogleFonts.lato(
                                  color: Colors.grey
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                                borderSide: BorderSide(width: 0.0, color: Colors.blue),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                                borderSide: BorderSide(width: 0.0, color: Colors.blue),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                                borderSide: BorderSide(width: 0.0, color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(18.0)),
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                          ),
                          child: TextFormField(
                            validator: (value){
                              if(value.length == 0) {
                                return 'This field cannot be empty';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              _panNumber = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'PAN Number',
                              hintText: 'PAN Number',
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
                        padding: EdgeInsets.all(12.0),
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
                        padding: EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(18.0)),
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                          ),
                          child: TextFormField(
                            validator: (password){
                              if(password.length == 0) {
                                return 'Please enter your password id.';
                              }
                              if(password.length < 6) {
                                return 'Password should be at least 6 characters long';
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
                        padding: EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(18.0)),
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                          ),
                          child: TextFormField(
                            validator: (password){
                              if(password.length == 0) {
                                return 'Please re-enter your password id.';
                              }
                              if(_password != _confirmPassword) {
                                return 'Password does not match';
                              }
                              return null;
                            },
                            onChanged: (password) {
                              _confirmPassword = password;
                            },
                            decoration: InputDecoration(
                              labelText: 'Please re-enter your password.',
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
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: RaisedButton(
                    child: Text(
                      'Create Account',
                      style: GoogleFonts.lato(),
                    ),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
                    onPressed: () async{

                      if(_formKey.currentState.validate()) {
                        setState(() {
                          _isLoading = false;
                        });
                        print('------------------------');
                        Map<String, String> _createAccountResponse = await _authenticateProvider.createAccountUsingEmail(_email, _password);
                        print('_________________________');
                        if(_createAccountResponse['error'] == null) {
                          print('UID is: ${_createAccountResponse['uid']}');
                          _userProvider.panNumber = _panNumber;
                          _userProvider.adhaarNumber = _adhaarNumber;
                          _userProvider.email = _email;
                          _userProvider.role = widget.role;
                          _userProvider.uid = _createAccountResponse['uid'];
                          await _userServices.createUserOnFirestore(_userProvider);
                          await _db.insert({
                            LoginActivityDatabase.columnName1 : _createAccountResponse['uid'],
                            LoginActivityDatabase.columnName2: widget.role,
                          });
                          setState(() {
                            _isLoading = true;
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavigationScreen(),
                              )
                          );
                        }
                        else {
                          setState(() {
                            _isLoading = true;
                          });
                          showDialog(
                            context: context,
                            child: ErrorAlertDialog(
                              title: 'Verification Failed',
                              error: _createAccountResponse['error'],
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
              ],
            ) :
            Container(
              height: MediaQuery.of(context).size.height,
              child: Center(
                  child: SpinKitWave(
                    color: Colors.white,
                    size: 50.0,
                    controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
                  )
              ),
            ),
          ),
        ),
      ),
    );
  }
}
