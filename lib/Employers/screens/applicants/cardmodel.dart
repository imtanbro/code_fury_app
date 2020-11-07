import 'package:flutter/material.dart';
import 'package:codefuryapp/screens/applicants/applicant_detail.dart';
class CardModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("ontap");
        Navigator.push(context, MaterialPageRoute(builder: (context) => ApplicantDetail()));
      },
      child: Card(
        elevation: 10,
        child: Container(
          margin: EdgeInsets.all(15),
          child: ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.supervised_user_circle) ,
            ),
            title: Text('FirstName LastName'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Phone Number : 9876543210') ,
                Text('State : Maharashtra '),
                Text('Experience : 4')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
