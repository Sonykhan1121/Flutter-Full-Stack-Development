import 'package:flutter/material.dart';

class AppbarTesting extends StatefulWidget {
  const AppbarTesting({super.key});

  @override
  State<AppbarTesting> createState() => _AppbarTestingState();
}

class _AppbarTestingState extends State<AppbarTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enhanced AppBar'),
        backgroundColor: Colors.transparent,
        // Transparency for gradient
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.red],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 10,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Handle drawer opening
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              // Handle favorite action
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Handle settings
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Container(
            alignment: Alignment.center,
            child: Text('Subheader', style: TextStyle(color: Colors.white)),
            height: 50.0,
          ),
        ),
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
      ),
      body: Center(
        child: Text('Content goes here!'),
      ),
    );

  }
}
