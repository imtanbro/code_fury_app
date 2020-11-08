import 'package:flutter/material.dart';

class MyProfileHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                maxRadius: 50,
                backgroundColor: Colors.blue,
                //background image use karle company ka image
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Company Name',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold ,
                  color: Colors.black
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Company Description :',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text('actuatl description text her ejfakna;dfnalk sdfn;l kdsanfkl dfkdfdkfjkdfjdksjfkfdjf;kj;askf ',
            style: TextStyle(
              fontSize: 20
            ),
          ),
          SizedBox(
            height: 15,
          ),

          Text('Pan Number',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text('Total no of job type : ',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text('Total no of opening : ',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          )

        ],
      ),
    );
  }
}
