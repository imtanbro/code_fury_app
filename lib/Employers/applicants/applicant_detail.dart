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
              Positioned(
                top: 20,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
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
                          Text('Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ),
              SizedBox(
                height: 75,
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white

                ),
                child: Column(
                  children: [
                    Text('Applicant Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
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
                                  'FirstName LastName',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    )

                                ),
                                Text(
                                  'phone no. 5455165165165',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                Text(
                                    'emai id :Oratahjfhjafh@fhdjh.com',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    )
                                )
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
