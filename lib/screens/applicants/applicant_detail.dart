import 'package:flutter/material.dart';

class ApplicantDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Positioned(
                  top: 20,
                  child: Container(
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        )
                      ],
                    ),
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
