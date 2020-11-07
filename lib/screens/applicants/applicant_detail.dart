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
            Positioned(
              top: 100,
                child: Container(
                  padding: EdgeInsets.all(20),
                  height:MediaQuery.of(context).size.height ,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Applicant Information',
                        style: TextStyle(
                            color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
