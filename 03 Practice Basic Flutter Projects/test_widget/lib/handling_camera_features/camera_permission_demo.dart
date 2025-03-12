import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPermissionDemo extends StatefulWidget {
  const CameraPermissionDemo({Key? key}) : super(key: key);

  @override
  State<CameraPermissionDemo> createState() => _CameraPermissionDemoState();
}

class _CameraPermissionDemoState extends State<CameraPermissionDemo> {
  CameraController? _cameraController;
  List<CameraDescription> cameras = [];
  bool _isCameraInitialized = false;
  bool _isPermissionGranted = false;
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _checkPermissionStatus();
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> _checkPermissionStatus() async {
    final status = await Permission.camera.status;
    setState(() {
      _isPermissionGranted = status.isGranted;
    });

    if (_isPermissionGranted) {
      _initializeCamera();
    }
  }

  Future<void> _requestCameraPermission() async {
    await Permission.camera
        .onDeniedCallback(() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Camera permission denied')),
      );
    })
        .onGrantedCallback(() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Camera permission granted')),
      );
      _initializeCamera();
    })
        .onPermanentlyDeniedCallback(() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Camera permission permanently denied. Please enable it in app settings.'),
          action: SnackBarAction(
            label: 'Settings',
            onPressed: () => openAppSettings(),
          ),
        ),
      );
    })
        .request();
  }

  Future<void> _initializeCamera() async {
    try {
      cameras = await availableCameras();

      if (cameras.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No cameras available')),
        );
        return;
      }

      _cameraController = CameraController(
        cameras[0],
        ResolutionPreset.high,
        enableAudio: false,
      );

      await _cameraController!.initialize();

      if (!mounted) return;

      setState(() {
        _isCameraInitialized = true;
        _isPermissionGranted = true;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error initializing camera: $e')),
      );
    }
  }

  Future<void> _takePicture() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Camera not initialized')),
      );
      return;
    }

    try {
      final directory = await getTemporaryDirectory();
      final String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final String filePath = path.join(directory.path, fileName);

      await _cameraController!.takePicture().then((XFile file) async {
        // Copy the image to our app's storage
        final File imageFile = File(file.path);
        final File savedImage = await imageFile.copy(filePath);

        // Save to gallery
        await GallerySaver.saveImage(savedImage.path, albumName: 'Camera Demo');

        setState(() {
          _imagePath = savedImage.path;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Picture saved to gallery')),
        );
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error taking picture: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Permission Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!_isPermissionGranted)
              ElevatedButton(
                onPressed: _requestCameraPermission,
                child: const Text('Request Camera Permission'),
              ),
            if (_isPermissionGranted && !_isCameraInitialized)
              const CircularProgressIndicator(),
            if (_isCameraInitialized)
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CameraPreview(_cameraController!),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _takePicture,
                      child: const Text('Take Picture'),
                    ),
                    const SizedBox(height: 20),
                    if (_imagePath != null)
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            const Text('Captured Image:'),
                            const SizedBox(height: 10),
                            Expanded(
                              child: Image.file(
                                File(_imagePath!),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}