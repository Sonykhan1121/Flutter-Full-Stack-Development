import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {


  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Text("Hello There"),
      ),
    );
  }
}
