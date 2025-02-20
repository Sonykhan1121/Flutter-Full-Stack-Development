import 'package:flutter/material.dart';

class CardTest extends StatefulWidget {
  const CardTest({super.key});

  @override
  State<CardTest> createState() => _CardTestState();
}

class _CardTestState extends State<CardTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Card Test")),
      body: Center(
        child: Card(
          elevation: 4.0,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          margin: EdgeInsets.all(20),
          child: Container(
            width: 300,
            height: 200,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.alarm, size: 50, color: Colors.blue),
                Text('Alarm', style: TextStyle(fontSize: 24)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
