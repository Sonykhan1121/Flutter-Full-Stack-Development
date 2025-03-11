import 'dart:developer';

import 'package:flutter/material.dart';

class LoggingTest extends StatefulWidget {
  const LoggingTest({super.key});

  @override
  State<LoggingTest> createState() => _LoggingTestState();
}

class _LoggingTestState extends State<LoggingTest> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("i am debug print");
    log('this is log message',name: 'init');
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Logging Test'),

      ),
      body: Center(
        child: Text('Testing'),
      ),
    );
  }
}
