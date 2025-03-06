import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

class Testpage extends StatefulWidget {
  const Testpage({super.key});

  @override
  State<Testpage> createState() => _TestpageState();
}

class _TestpageState extends State<Testpage> {
  bool _isLoading = false;

  void bluetoothSupportCheck() async {
    if(!Platform.isAndroid)
      {
        buildShowSnackBar(context, 'This platform is not Android');
        return;
      }
    if (await FlutterBluePlus.isSupported == false) {
      buildShowSnackBar(context, 'Bluetooth not supported by this device');
      return;
    } else {
      buildShowSnackBar(context, 'Congratulation. your device is supported');
    }
  }

  void openBluetoothSettings() async {
    if (Platform.isAndroid) {
      await launchUrl(Uri.parse('android.settings.BLUETOOTH_SETTINGS'));
    } else {
      buildShowSnackBar(context, "Only supported on Android.");
    }
  }


  void turnOnBluetooth() async {
    if(!Platform.isAndroid)
    {
      buildShowSnackBar(context, "Please make sure you use android device");
      return;
    }
    setState(() {
      _isLoading = true;
    });

    // Request Bluetooth permission
    PermissionStatus status = await Permission.bluetooth.request();

    if (status.isGranted) {
      // Bluetooth permission granted
      buildShowSnackBar(context,'Bluetooth permission granted!');
    } else if (status.isDenied || status.isPermanentlyDenied) {
      // If the permission is denied, show a prompt to go to settings
      buildShowSnackBar(context,'Bluetooth permission denied. Please enable it in settings.');

      // Open settings page (general settings)
      openBluetoothSettings();
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bluetooth features')),
      body: Center(
        child:
            _isLoading
                ? CircularProgressIndicator()
                : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.bluetooth, size: 200),
                    Text('This is a test page for Bluetooth features.'),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: bluetoothSupportCheck,
                      child: Text('Support check'),
                    ),
                    ElevatedButton(
                      onPressed: turnOnBluetooth,
                      child: Text('Turn On'),
                    ),

                  ],
                ),
      ),
    );
  }

  void buildShowSnackBar(BuildContext context, String s) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(s)));
  }
}
