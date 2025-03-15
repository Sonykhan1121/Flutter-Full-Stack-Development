import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPermissionDemo extends StatelessWidget {
  const CameraPermissionDemo({super.key});

  @override
  Widget build(BuildContext context) {
    CameraController? _cameraController;

    final bool _isPermissionGranted = false;

    Future<void> _requestCameraPermission() async {
    }
    Future<void> _isCameraInitialized() async {

    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera Permission Page"),

      ),
      body: Center(
        child: Column(
          children: [
            if(!_isPermissionGranted)

                ElevatedButton(
                  onPressed: _requestCameraPermission,
                  child: Text('Request Camera Permission'),
                ),



          ],
        )
      ),
    );
  }
}
