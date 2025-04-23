import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'device_list_page.dart';

class BluetoothScanPage extends StatefulWidget {
  const BluetoothScanPage({Key? key}) : super(key: key);

  @override
  State<BluetoothScanPage> createState() => _BluetoothScanPageState();
}

class _BluetoothScanPageState extends State<BluetoothScanPage> with TickerProviderStateMixin {
  bool _isScanning = false;
  List<ScanResult> _scanResults = [];

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,

    );

    _startScan();

    // Listen for scan results
    FlutterBluePlus.scanResults.listen((results) {
      setState(() {
        _scanResults = results;
      });
    }, onError: (e) {
      print("Scan error: $e");
    });

    // Listen for scan status
    FlutterBluePlus.isScanning.listen((isScanning) {
      setState(() {
        _isScanning = isScanning;
      });
    });
  }

  Future<void> _startScan() async {
    print('startScan');
    print('_iscanning : ${_isScanning}');
    try {
      await FlutterBluePlus.startScan(
        timeout: const Duration(seconds: 15),
      );

    } catch (e) {
      print('Error starting scan: $e');
    }
  }

  Future<void> _stopScan() async {
    print('StopScan');

    try {
      await FlutterBluePlus.stopScan();
    } catch (e) {
      print('Error stopping scan: $e');
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _stopScan();
    super.dispose();
  }

  void _navigateToDeviceList() {
    _stopScan();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeviceListPage(devices: _scanResults),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Scanning for Devices'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.bluetooth_searching,
                  size: 80,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              _isScanning ? 'Searching for devices...' : 'Search completed',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              '${_scanResults.length} devices found',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _navigateToDeviceList,
              child: const Text('View All Devices'),
            ),
          ],
        ),
      ),
    );
  }
}