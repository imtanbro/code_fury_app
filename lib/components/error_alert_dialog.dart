import 'package:flutter/material.dart';

class ErrorAlertDialog extends StatelessWidget {

  final String error;
  final String title;

  ErrorAlertDialog({
    @required this.error,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(
        error,
      ),
      actions: <Widget>[
        RaisedButton(
          child: Text('Try Again'),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
