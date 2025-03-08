import 'package:flutter/material.dart';

class ImageZoomAndScapping extends StatefulWidget {
  const ImageZoomAndScapping({super.key});

  @override
  State<ImageZoomAndScapping> createState() => _ImageZoomAndScappingState();
}

class _ImageZoomAndScappingState extends State<ImageZoomAndScapping> {
  late TransformationController _transformationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _transformationController = TransformationController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Interactive Image Viewer'),),
      body: Center(
        child: InteractiveViewer(
          transformationController: _transformationController,
            boundaryMargin: EdgeInsets.all(20.0),
            minScale: 0.1,
            maxScale: 3.0,
            child: Image.asset('assets/images/tht_logo.png'),),
      ),
    );
  }
}
