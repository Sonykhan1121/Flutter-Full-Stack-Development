import 'package:flutter/material.dart';

class Scale extends StatefulWidget {
  const Scale({super.key});

  @override
  State<Scale> createState() => _ScaleState();
}

class _ScaleState extends State<Scale> {
  double _scale = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scalling')),
      body: Center(
        child: Stack(
          children: [
            Transform(
              transform: Matrix4.identity()..scale(_scale),
              child: Container(color: Colors.blue, width: 300, height: 300),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onScaleUpdate: (details) {
                  _scale+=details.scale;
                },
                  child: Icon(Icons.add, color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
