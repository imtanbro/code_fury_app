import 'package:flutter/material.dart';

class ApplicantDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Container(
                      child: IconButton(icon: Icon(
                          Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 30,
                      ), onPressed: null),
                    ),
                    Text('Applicants',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 75,
              ),

              Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white

                ),
                child: Column(
                  children: [
                    Text('Applicant Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(

                      child:Row(
                        children: [
                          Container(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.blue,
                            ),
                          ),
                          SizedBox(width: 30,),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'FirstName  LastName',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    )

                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'phone no. 5455165165165',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    'emai id :Oratahjfhjafh@fhdjh.com',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          )
                        ],
                      ) ,
                    ),
                    Column(
                      children: [
                        //additional content
                      ],
                    )

                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
