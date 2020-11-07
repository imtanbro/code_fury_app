import 'package:codefuryapp/Employee/Screens/HomeScreen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email, password, name, pan, adhar,address,city,state;
  final _formKey = GlobalKey<FormState>();

  Widget customfield(String label,String value) {
    return TextFormField(
      cursorColor: Colors.blue,
      style: TextStyle(
        color: Color.fromRGBO(244, 180, 0, 1),
        decorationColor: Color.fromRGBO(66, 133, 244, 1),
        fontSize: 19,
        // backgroundColor: Colors.blue,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 18,
          color: Colors.blue,
        ),
        // fillColor: Colors.white,
        // filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueGrey, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      onChanged: (val) {
        value = val;
      },
      validator: (val) {
        if (val.isEmpty) {
          return "Enter ${label}";
        }

        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
                  child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Column(
                        children: [
                          customfield("Name",name),
                          SizedBox(
                            height: 15,
                          ),

                          TextFormField(
                            cursorColor: Colors.blue,
                            style: TextStyle(
                              color: Color.fromRGBO(244, 180, 0, 1),
                              decorationColor: Color.fromRGBO(66, 133, 244, 1),
                              fontSize: 19,
                              // backgroundColor: Colors.blue,
                            ),
                            decoration: InputDecoration(
                              labelText: "Pan Card Number (optional)",
                              labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                              // fillColor: Colors.white,
                              // filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.blueGrey, width: 2.0),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            onChanged: (val) {
                              pan = val;
                            },
                            // validator: (val) {
                            //   if (val.isEmpty) {
                            //     return "Enter Name";
                            //   }
                            //   return null;
                            // },
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          TextFormField(
                            cursorColor: Colors.blue,
                            style: TextStyle(
                              color: Color.fromRGBO(244, 180, 0, 1),
                              decorationColor: Color.fromRGBO(66, 133, 244, 1),
                              fontSize: 19,
                              // backgroundColor: Colors.blue,
                            ),
                            decoration: InputDecoration(
                              labelText: "Adhar Card Number (optional)",
                              labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                              // fillColor: Colors.white,
                              // filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.blueGrey, width: 2.0),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            onChanged: (val) {
                              adhar = val;
                            },
                            // validator: (val) {
                            //   if (val.isEmpty) {
                            //     return "Enter Name";
                            //   }
                            //   return null;
                            // },
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          customfield("Address",address),
                          SizedBox(
                            height: 15,
                          ),
                          customfield("City",city),
                          SizedBox(
                            height: 15,
                          ),
                          customfield("State",state),
                          SizedBox(
                            height: 15,
                          ),

                          TextFormField(
                            cursorColor: Colors.blue,
                            style: TextStyle(
                              color: Color.fromRGBO(244, 180, 0, 1),
                              decorationColor: Color.fromRGBO(66, 133, 244, 1),
                              fontSize: 19,
                              // backgroundColor: Colors.blue,
                            ),
                            decoration: InputDecoration(
                              labelText: "Email (Optional)",
                              labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                              // fillColor: Colors.white,
                              // filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.blueGrey, width: 2.0),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            onChanged: (val) {
                              email = val;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          TextFormField(
                            cursorColor: Colors.blue,
                            style: TextStyle(
                              color: Color.fromRGBO(244, 180, 0, 1),
                              decorationColor: Color.fromRGBO(66, 133, 244, 1),
                              fontSize: 19,
                              // backgroundColor: Colors.blue,
                            ),
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                              // fillColor: Colors.white,
                              // filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.blueGrey, width: 2.0),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            onChanged: (val) {
                              password = val;
                            },
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Enter Password";
                              }
                              if (val.length < 6) {
                                return "Password should be 6 Char Long";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          // GestureDetector(
                          //     onTap: () {
                          //   if (_formKey.currentState.validate()) {
                          //     print("Valid");
                          //     print(email);

                          //     // context
                          //     //     .read<AuthService>()
                          //     //     .signUp(
                          //     //       email: email,
                          //     //       pass: password,
                          //     //     )
                          //     //     .then((value) => Navigator.pushReplacement(
                          //     //         context,
                          //     //         MaterialPageRoute(
                          //     //             builder: (context) => HomePage())));
                          //   } else {
                          //     print("InValid");
                          //   }
                          // },
                          // child: customButton(context, "Sign Up", 50)),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            print("Valid");
            print(email);
            print(address);
            print(adhar);
            print(address);
            print(city);
            print(state);
            print(pan);

            Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Home()));

            // context
            //     .read<AuthService>()
            //     .signUp(
            //       email: email,
            //       pass: password,
            //     )
            //     .then((value) => Navigator.pushReplacement(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => HomePage())));
          } else {
            print("InValid");
          }
        },
      ),
    );
  }
}
