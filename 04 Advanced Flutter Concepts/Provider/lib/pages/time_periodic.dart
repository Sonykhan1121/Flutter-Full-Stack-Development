import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learning_provider/provider/count_provider.dart';
import 'package:provider/provider.dart';

class TimePeriodic extends StatefulWidget {
  const TimePeriodic({super.key});

  @override
  State<TimePeriodic> createState() => _TimePeriodicState();
}

class _TimePeriodicState extends State<TimePeriodic> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      final countProvider = Provider.of<CountProvider>(context, listen: false);
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Periodic'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Time : ${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()} : ${DateTime.now().second.toString()}',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 50),
            Consumer<CountProvider>(builder: (context, value, child) {
              return Text(
                value.count.toString(),
                style: TextStyle(fontSize: 50),
              );
            }),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {},
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
