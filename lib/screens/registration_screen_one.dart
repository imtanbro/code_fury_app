import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:codefuryapp/Service/authentication.dart';
import 'package:codefuryapp/Service/providers/custom_user.dart';
import 'package:codefuryapp/components/error_alert_dialog.dart';
import 'package:codefuryapp/screens/registration_screen_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> with TickerProviderStateMixin{

  final _formKey = GlobalKey<FormState>();
  String _name;
  String _phoneNumber;
  bool _loadingFlag = false;
  bool _loadingVerifiedFlag = true;
  Authenticate _authenticateProvider;

  @override
  void didChangeDependencies() {
    _authenticateProvider = Provider.of<Authenticate>(context, listen: true);
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {

    final _userProvider = Provider.of<CustomUser>(context, listen: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF009FFD),
                Color(0xFF2A2A72),
              ]
            )
          ),
          child: _loadingVerifiedFlag ? Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage('images/logo.png'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: TypewriterAnimatedTextKit(
                            totalRepeatCount: 3,
                            speed: Duration(milliseconds: 300),
                            onTap: () {
                              print("Tap Event");
                            },
                            text: [
                              "Welcomes You!",
                            ],
                            textStyle: GoogleFonts.pacifico(
                              fontSize: 40.0,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.start,
                            alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                                color: Colors.white,
                                border: Border.all(color: Colors.white),
                              ),
                              child: TextFormField(
                                validator: (name){
                                  if(name.length == 0) {
                                    return 'Please enter your name.';
                                  }
                                  return null;
                                },
                                onChanged: (name) {
                                  _name = name;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Please enter your name.',
                                  hintText: 'name',
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
                                validator: (phoneNumber){
                                  if(phoneNumber.length == 0) {
                                    return 'Please enter your phone number.';
                                  }
                                  return null;
                                },
                                onChanged: (phoneNumber) {
                                  _phoneNumber = phoneNumber;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Please enter your phone number.',
                                  hintText: 'Phone Number',
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
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: FlatButton(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Send OTP',
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(32.0))
                              ),
                              onPressed: () async{
                                if(_formKey.currentState.validate()){


                                  _userProvider.name = _name;
                                  setState(() {
                                    _loadingFlag = true;
                                  });
                                  await _authenticateProvider.sendOTP(_phoneNumber);
                                  setState(() {
                                    _loadingFlag = false;
                                  });
                                  if(_authenticateProvider.error == null) {
                                  }
                                  else {
                                    showDialog(
                                      context: context,
                                      child: ErrorAlertDialog(
                                        title: 'Verification Failed',
                                        error: _authenticateProvider.error,
                                      ),
                                    );
                                  }
                                }
                              },
                              color: Colors.white,
                            ),
                          ),

                          Visibility(
                            visible: _authenticateProvider.flag,
                            child: RaisedButton(
                              padding: EdgeInsets.all(8.0),
                              color: Colors.white,
                              child: Text(
                                'Enter OTP',
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(32.0))
                              ),
                              onPressed: () async{
                                String otp = "";
                                showDialog(
                                  context: context,
                                  child: Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32.0)
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.95,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(18.0),
                                            child: Text(
                                              'OTP',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.lato(
                                                  fontSize: 27.0
                                              ),
                                            ),
                                          ),

                                          Divider(),

                                          Padding(
                                            padding: EdgeInsets.all(18.0),
                                            child: OTPTextField(
                                              length: 6,
                                              width: MediaQuery.of(context).size.width,
                                              style: GoogleFonts.lato(
                                                fontSize: 12,
                                              ),
                                              textFieldAlignment: MainAxisAlignment.spaceAround,
                                              fieldStyle: FieldStyle.underline,
                                              onCompleted: (pin) {
                                                otp = pin;
                                                print("Completed: " + pin);
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                FlatButton(
                                                  child: Text('Cancel'),
                                                  onPressed: (){
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                FlatButton(
                                                  child: Text('Verify'),
                                                  onPressed: () async{
                                                    if(otp.length < 6) {
                                                      Fluttertoast.showToast(msg: 'Enter valid OTP');
                                                    }
                                                    else {
                                                      Map<String, String> _response = await _authenticateProvider.verifyPhoneNumber(otp, _authenticateProvider.verificationID);
                                                      if(_response['error'] == null) {
                                                        _authenticateProvider.flag = false;
                                                        print('Verified Successfully');
                                                        _userProvider.phoneNumber = _phoneNumber;
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              title: Text('Please select role'),
                                                              content: Column(
                                                                mainAxisSize: MainAxisSize.min,
                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                                                                    child: RaisedButton(
                                                                      color: Colors.blue,
                                                                      child: Text(
                                                                        'Company/Hirer',
                                                                        style: GoogleFonts.lato(
                                                                            color: Colors.white
                                                                        ),
                                                                      ),
                                                                      onPressed: () {
                                                                        //Employer
                                                                        Navigator.pop(context);
                                                                        Navigator.pop(context);
                                                                        Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context)=> RegistrationScreenTwo(
                                                                              role: 'employer',
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                                                                    child: RaisedButton(
                                                                      color: Colors.blue,
                                                                      child: Text(
                                                                        'Job Seeker',
                                                                        style: GoogleFonts.lato(
                                                                          color: Colors.white
                                                                        ),
                                                                      ),
                                                                      onPressed: () {
                                                                        Navigator.pop(context);
                                                                        Navigator.pop(context);
                                                                        Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context)=> RegistrationScreenTwo(
                                                                              role: 'employee',
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          }
                                                        );
                                                      }
                                                      else {
                                                        showDialog(
                                                          context: context,
                                                          child: ErrorAlertDialog(
                                                            title: 'Verification Failed',
                                                            error: _response['error'],
                                                          ),
                                                        );
                                                      }
                                                    }
                                                  },
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ],
              ), _loadingFlag ? Center(
                  child: SpinKitDoubleBounce(
                    color: Colors.white,
                    size: 50.0,
                    controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
                  )
              ): Offstage(),
            ],
          ) : Center(
              child: SpinKitWave(
                color: Colors.white,
                size: 50.0,
                controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
              )
          ),
        ),
      ),
    );
  }
}
