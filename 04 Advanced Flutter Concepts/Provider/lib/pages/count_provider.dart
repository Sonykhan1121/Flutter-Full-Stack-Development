import 'package:flutter/material.dart';

class CountProvider extends StatefulWidget {
  const CountProvider({super.key});

  @override
  State<CountProvider> createState() => _CountProviderState();
}

class _CountProviderState extends State<CountProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Count Provider'),
      ),
      body: Center(
        child: Text(
          "0",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
