import 'package:flutter/material.dart';
import 'cardmodel.dart';

class ListViewApplicants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applicants',
        style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemBuilder: (context,index){
          return CardModel();
        },
        itemCount:10 ,
      ),
    );
  }
}
