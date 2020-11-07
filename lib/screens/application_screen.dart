import 'package:flutter/material.dart';
import 'applicants/list_view_applicants.dart';

class Applicants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applicants',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListViewApplicants(),
    );
  }
}
