import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class ImageUploadPage extends StatefulWidget {
  @override
  _ImageUploadPageState createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage> {
  File? _image;
  double _uploadProgress = 0;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> uploadImage() async {
    if (_image == null) return;

    String imageUrl = await uploadImageToFileServer(_image!); // Assume this method uploads the image and returns the URL

    var dio = Dio();
    var data = {
      'title': 'test product',
      'price': 13.5,
      'description': 'lorem ipsum set',
      'image': imageUrl,
      'category': 'electronic'
    };

    try {
      var response = await dio.post(
        'https://fakestoreapi.com/products',
        data: data,
        onSendProgress: (int sent, int total) {
          setState(() {
            _uploadProgress = sent / total;
          });
        },
      );
      if (response.statusCode == 200) {
        _showSnackBar('Product uploaded successfully');
      } else {
        _showSnackBar('Failed to upload product');
      }
    } catch (e) {
      _showSnackBar('Failed to upload product: $e');
    }
  }

  Future<String> uploadImageToFileServer(File image) async {
    // Implement the logic to upload the image to a server that returns the URL of the uploaded image.
    // For this example, return a placeholder URL.
    return 'https://example.com/path/to/image.jpg';
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Product')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: _image != null ? FileImage(_image!) : null,
              child: _image == null ? Icon(Icons.person, size: 60) : null,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: pickImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: uploadImage,
              child: Text('Upload Product'),
            ),
            SizedBox(height: 20),
            LinearProgressIndicator(
              value: _uploadProgress,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 20),
            Text('${(_uploadProgress * 100).toStringAsFixed(2)}% uploaded'),
          ],
        ),
      ),
    );
  }
}
