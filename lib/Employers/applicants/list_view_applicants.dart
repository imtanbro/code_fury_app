import 'package:flutter/material.dart';
import 'cardmodel.dart';

class ListViewApplicants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,index){
        return CardModel();
      },
      itemCount:10 ,
    );
  }
}
