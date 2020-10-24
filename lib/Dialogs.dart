import 'package:flutter/material.dart';

class Dialogs {
  information (BuildContext context, String title, String description){
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(description)
              ],
            ),
          ),
          actions: [
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Ok'),
            )
          ],
        );
      }
    );
  }
}

  waiting(BuildContext context, String title, String description){

}