import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  Widget formCustom(double size) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size,
        ),
        Text(
          "Login",
          style: TextStyle(
              color: Colors.orange,
              fontSize: 36,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 16,
        ),
        TextFormField(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.grey[200])),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.grey[300])),
              filled: true,
              fillColor: Colors.grey[100],
              hintText: "Mobile Number"),
          controller: _phoneController,
          keyboardType: TextInputType.number,
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          width: double.infinity,
          child: FlatButton(
            child: Text("LOGIN"),
            textColor: Colors.white,
            padding: EdgeInsets.all(16),
            onPressed: () {
              final phone = _phoneController.text.trim();

              // loginUser(phone, context);
            },
            color: Colors.blue,
          ),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: OrientationBuilder(
            builder: (context, orientation) {
              return orientation == Orientation.portrait
                  ? formCustom(200)
                  : formCustom(20);
              // if (orientation == Orientation.landscape) {
              //   return formCustom(150);
              // } else formCustom(20);
            },
            // child:
          ),
        ),
      ),
    );
  }
}
