import 'package:flutter/material.dart';

class Gesture extends StatefulWidget {
  const Gesture({super.key});

  @override
  State<Gesture> createState() => _GestureState();
}

class _GestureState extends State<Gesture> {
  double _scale = 1.0;
  double _rotation = 0.0;
  Offset _offset = Offset.zero;
  List<List<String>> tableData = [
    [" ", " "],
    [" ", " "],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Interactive Container')),
      body: Center(
        child: GestureDetector(
          // Scale gesture
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              _scale = details.scale;
              _rotation = details.rotation;
              _offset += details.focalPointDelta;
            });
          },
          // Reset transformations on double tap
          onDoubleTap: () {
            setState(() {
              _scale = 1.0;
              _rotation = 0.0;
              _offset = Offset.zero;
            });
          },
          child: Transform(
            // Apply transformations
            transform:
                Matrix4.identity()
                  ..translate(_offset.dx, _offset.dy)
                  ..scale(_scale)
                  ..rotateZ(_rotation),
            alignment: FractionalOffset.center,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage('https://picsum.photos/250'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  'Pinch to Scale\nRotate to Rotate\nDrag to Move\nDouble Tap to Reset',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

          ),
        ),
      ),
    );
  }


}
