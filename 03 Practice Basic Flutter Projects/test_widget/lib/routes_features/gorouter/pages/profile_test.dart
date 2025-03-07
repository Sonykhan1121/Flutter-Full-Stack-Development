import 'package:flutter/material.dart';
class ProfileTest extends StatefulWidget {
  final String userId;
  ProfileTest({required this.userId});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileTest> {

  String _profileName = 'Loading...';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(child: Text('Profile id: ${widget.userId}')),
    );
  }
}