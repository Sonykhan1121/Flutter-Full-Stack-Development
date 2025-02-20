import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class ImageConversionExample extends StatefulWidget {
  @override
  _ImageConversionExampleState createState() => _ImageConversionExampleState();
}

class _ImageConversionExampleState extends State<ImageConversionExample> {
  Uint8List? _imageBytes;
  Image? _imageFromBytes;
  Image? _imageFromByteData;

  // Function to pick and process an image
  Future<void> pickAndProcessImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      // Convert XFile to Uint8List
      Uint8List imageBytes = await file.readAsBytes();
      setState(() {
        _imageBytes = imageBytes;
        _imageFromBytes = Image.memory(imageBytes);
      });

      // Convert Uint8List to ByteData and back to Uint8List for display
      ByteData byteData = imageBytes.buffer.asByteData();
      Uint8List bytesFromByteData = byteData.buffer.asUint8List();
      setState(() {
        _imageFromByteData = Image.memory(bytesFromByteData);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Conversion Example'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: pickAndProcessImage,
                child: Text('Pick and Process Image'),
              ),
              if (_imageFromBytes != null) _imageFromBytes!,
              if (_imageFromByteData != null) _imageFromByteData!,
            ],
          ),
        ),
      ),
    );
  }
}