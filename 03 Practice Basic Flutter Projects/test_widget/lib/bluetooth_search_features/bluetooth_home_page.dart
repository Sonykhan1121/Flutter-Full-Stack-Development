import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

import 'bluetooth_scan_page.dart';

class BluetoothHomePage extends StatefulWidget {
  const BluetoothHomePage({Key? key}) : super(key: key);

  @override
  State<BluetoothHomePage> createState() => _BluetoothHomePageState();
}

class _BluetoothHomePageState extends State<BluetoothHomePage> with SingleTickerProviderStateMixin {
  bool _isBluetoothOn = false;

  @override
  void initState() {
    super.initState();
    _checkBluetoothStatus();

    // Listen for Bluetooth state changes
    FlutterBluePlus.adapterState.listen((state) {
      setState(() {
        _isBluetoothOn = state == BluetoothAdapterState.on;
      });
    });
  }

  Future<void> _checkBluetoothStatus() async {
    final state = await FlutterBluePlus.adapterState.first;
    setState(() {
      _isBluetoothOn = state == BluetoothAdapterState.on;
    });
  }

  Future<void> _requestBluetoothPermission() async {
    final permissions = [
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.bluetoothAdvertise,
      Permission.location,
    ];


    // Request permissions
    final statuses = await permissions.request();
    print('map: $statuses');

    // Check if all permissions are granted
    final allGranted = statuses.values.every((status) => status.isGranted);

    if (allGranted) {
      // Try turning Bluetooth on
      if (!_isBluetoothOn) {
        try {
          await FlutterBluePlus.turnOn();
        } catch (e) {
          debugPrint('Bluetooth turn on failed: $e');
          _showBluetoothSettingsDialog();
        }
      }
    } else {
      _showPermissionDeniedDialog();
    }
  }


  void _showBluetoothSettingsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:  Text('Bluetooth is Off'),
        content:  Text('Please enable Bluetooth in your device settings to continue.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child:  Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Open app settings instead of Bluetooth settings directly
              openAppSettings();
            },
            child:  Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permissions Required'),
        content: const Text('Bluetooth and location permissions are required to scan for devices.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  void _navigateToScanPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BluetoothScanPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Finding Bluetooth Lists'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              'You can find all bluetooth devices nearby.',
              style: TextStyle(fontSize: 14.sp),
            ),
             SizedBox(height: 30.h),
            ElevatedButton.icon(
              icon:  Icon(Icons.bluetooth_searching),
              label:  Text('Search Bluetooth Devices'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              ),
              onPressed: () async {
                if (_isBluetoothOn) {
                  _navigateToScanPage();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(

                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 15.w),
                      content: Text('Please enable Bluetooth first using the floating button'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _requestBluetoothPermission,
        tooltip: 'Enable Bluetooth',
        child: Icon(_isBluetoothOn ? Icons.bluetooth : Icons.bluetooth_disabled),
      ),
    );
  }

}