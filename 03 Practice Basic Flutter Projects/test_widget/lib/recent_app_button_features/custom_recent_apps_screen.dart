import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomRecentAppsScreen extends StatefulWidget {
  @override
  _CustomRecentAppsScreenState createState() => _CustomRecentAppsScreenState();
}

class _CustomRecentAppsScreenState extends State<CustomRecentAppsScreen> {
  @override
  void initState() {
    super.initState();
    _updateRecentAppsAppearance();
  }

  void _updateRecentAppsAppearance() {
    SystemChrome.setApplicationSwitcherDescription(
      ApplicationSwitcherDescription(
        label: 'My Custom App',
        primaryColor: Colors.blue.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Recent Apps')),
      body: Center(child: Text('Switch apps to see the custom title & color')),
    );
  }
}