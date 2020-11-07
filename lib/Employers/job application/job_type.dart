

import 'package:flutter/material.dart';
import 'job_model.dart';

class JobType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,index){
        return JobModel();
      },
      itemCount:2 ,
    );
  }
}
