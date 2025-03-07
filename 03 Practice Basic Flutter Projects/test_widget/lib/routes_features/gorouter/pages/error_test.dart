import 'package:flutter/material.dart';

class ErrorTest extends StatelessWidget {
  String message;
   ErrorTest({super.key,required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error Page"),
      ),
      backgroundColor: Colors.red,
      body:Center(
        child: Text(message,style: TextStyle(fontSize: 36,color: Colors.white),),
      ),
    );
  }
}
