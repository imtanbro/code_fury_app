import 'package:flutter/material.dart';
import 'package:codefuryapp/Employers/applicants/list_view_applicants.dart';
class JobModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("ontap");
        Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewApplicants()));
      },
      child: Card(
        elevation: 10,
        child: Container(
          margin: EdgeInsets.all(15),
          child: ListTile(

            title: Text('Job Title',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                )
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('job description',
                    style: TextStyle(
                        fontSize: 20,
                    )
                ) ,
                Text('number of opening ',
                    style: TextStyle(
                      fontSize: 20,
                    )
                ),
                Text('closing date',
                    style: TextStyle(
                      fontSize: 20,
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


