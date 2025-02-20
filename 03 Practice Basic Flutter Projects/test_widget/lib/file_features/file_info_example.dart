import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileInfoExample extends StatefulWidget {
  @override
  _FileInfoExampleState createState() => _FileInfoExampleState();
}

class _FileInfoExampleState extends State<FileInfoExample> {
  String _status = 'No file selected';
  XFile? _pickedFile;

  // Function to pick a file using image_picker
  Future<void> pickFile() async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        _pickedFile = file;
        _status = 'File selected: ${file.path}';
        displayFileInformation(file);
      });
    }
  }

  // Function to display file information
  void displayFileInformation(XFile file) async {
    // Using XFile to get file information
    print('File path: ${file.path}');
    print('File name: ${file.name}');
    print('MIME type: ${await file.mimeType}'); // MIME type needs to be obtained asynchronously

    // Reading file data into ByteData
    Uint8List bytes = await file.readAsBytes();
    print("bytes : ${bytes}");
    ByteData byteData = bytes.buffer.asByteData();

    // Display some ByteData information
    print('ByteData length: ${byteData.lengthInBytes} bytes');

    // Save file using File class
    final directory = await getApplicationDocumentsDirectory();
    final newFilePath = '${directory.path}/${file.name}';
    final newFile = await File(newFilePath).writeAsBytes(bytes);
    print('File saved: ${newFile.path}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Information Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: pickFile,
              child: Text('Pick File'),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(_status),
            ),
          ],
        ),
      ),
    );
  }
}