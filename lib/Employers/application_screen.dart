import 'package:flutter/material.dart';
import 'package:codefuryapp/Employers/job application/job_type.dart';

class Applicants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: JobType(),
    );
  }
}
