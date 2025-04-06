import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class Finddevice extends StatefulWidget {
  const Finddevice({super.key});

  @override
  State<Finddevice> createState() => _FinddeviceState();
}

class _FinddeviceState extends State<Finddevice> {
  String _deviceInfo = "Tap the phone Icon to see device Info";


  Future<void> _getDeviceInfo() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    String info = '';

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      info = '''
      Id : ${androidDeviceInfo.id}
Brand: ${androidDeviceInfo.brand}
Model: ${androidDeviceInfo.model}
Android Version: ${androidDeviceInfo.version.release}
SDK: ${androidDeviceInfo.version.sdkInt}
Device: ${androidDeviceInfo.device}
Manufacturer: ${androidDeviceInfo.manufacturer}
      ''';
    }
    else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      info = '''
      Id : ${iosInfo.identifierForVendor}
Model: ${iosInfo.utsname.machine}
System Name: ${iosInfo.systemName}
System Version: ${iosInfo.systemVersion}
Device Name: ${iosInfo.name}
Identifier: ${iosInfo.identifierForVendor}
      ''';
    }
    else {
      info = "Unsupported Platform";
    }
    setState(() {
      _deviceInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Device Info')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.device_unknown, size: 150, color: Colors.blue),
                onPressed: _getDeviceInfo,
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(_deviceInfo),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
