import 'package:flutter/material.dart';

class ApplicantDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
            ),
            Positioned(
              top: 20,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Text('Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      )
                    ],
                  ),
                )
            ),
            
          ],
        ),
      ),
    );
  }
}
