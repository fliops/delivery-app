
import 'package:flutter/material.dart';

class FloatNumber extends StatelessWidget {
  const FloatNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      
     onPressed: () {
       showDialog(
         context: context,
         builder: (BuildContext context) {
           return AlertDialog(
             title: Text('Phone Number'),
             content: Text('011000000'),
             actions: <Widget>[
               TextButton(
                 child: Text('OK'),
                 onPressed: () {
                   Navigator.of(context).pop();
                 },
               ),
             ],
           );
         },
       );
     },
     backgroundColor: Color(0xff70A7FF),
     child: Icon(Icons.phone),
          );
  }
}
