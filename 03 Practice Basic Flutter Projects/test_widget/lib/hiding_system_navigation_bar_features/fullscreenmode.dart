import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class FullscreenMode extends StatefulWidget {
  @override
  _FullscreenModeState createState() => _FullscreenModeState();
}

class _FullscreenModeState extends State<FullscreenMode> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Navigation Bar Hidden!',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}