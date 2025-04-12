import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_widget/bluetooth_search_features/searching_screen.dart';

class BluetoothHomePage extends StatelessWidget {
  const BluetoothHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth Finder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Click the button below to search for devices',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _startBluetoothSearch(context);
              },
              child: const Text('Start Search'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startBluetoothSearch(context);
        },
        child: const Icon(Icons.bluetooth_searching),
      ),
    );
  }

  Future<void> _startBluetoothSearch(BuildContext context) async {
    print('startBluetoothsearch function');
    // Check if Bluetooth is enabled
    bool isBluetoothEnabled = await FlutterBluetoothSerial.instance.isEnabled ?? false;

    if (!isBluetoothEnabled) {
      if (context.mounted) {
        _showBluetoothDisabledDialog(context);
      }
      return;
    }

    // Request permissions
    bool hasPermissions = await _requestBluetoothPermissions(context);

    if (hasPermissions) {
      // Navigate to search screen if permissions granted
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SearchingScreen()),
        );
      }
    }
  }

  Future<bool> _requestBluetoothPermissions(BuildContext context) async {
    // Check and request Bluetooth permissions
    Map<Permission, PermissionStatus> statuses = await [
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.location, // Location is often required for Bluetooth scanning
    ].request();

    // Check if all permissions are granted
    bool allGranted = true;
    List<Permission> deniedPermissions = [];

    statuses.forEach((permission, status) {
      if (!status.isGranted) {
        allGranted = false;
        deniedPermissions.add(permission);
      }
    });

    // If any permission is denied, show dialog to open settings
    if (!allGranted && context.mounted) {
      _showPermissionDeniedDialog(context, deniedPermissions);
      return false;
    }

    return true;
  }

  void _showPermissionDeniedDialog(BuildContext context, List<Permission> deniedPermissions) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permissions Required'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'To find Bluetooth devices, this app needs the following permissions:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            ...deniedPermissions.map((permission) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                '• ${_getPermissionName(permission)}',
                style: const TextStyle(fontSize: 14),
              ),
            )),
            const SizedBox(height: 12),
            const Text(
              'Please enable these permissions in your device settings.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
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

  void _showBluetoothDisabledDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Bluetooth is Disabled'),
        content: const Text(
          'Please enable Bluetooth to search for devices. Would you like to enable it now?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              FlutterBluetoothSerial.instance.requestEnable();
            },
            child: const Text('Enable Bluetooth'),
          ),
        ],
      ),
    );
  }

  String _getPermissionName(Permission permission) {
    switch (permission) {
      case Permission.bluetooth:
        return 'Bluetooth';
      case Permission.bluetoothScan:
        return 'Bluetooth Scan';
      case Permission.bluetoothConnect:
        return 'Bluetooth Connect';
      case Permission.location:
        return 'Location (needed for Bluetooth scanning)';
      default:
        return permission.toString();
    }
  }
}
