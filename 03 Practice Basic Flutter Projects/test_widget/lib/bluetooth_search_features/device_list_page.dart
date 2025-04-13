import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class DeviceListPage extends StatelessWidget {
  final List<ScanResult> devices;

  const DeviceListPage({Key? key, required this.devices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Devices'),
      ),
      body: devices.isEmpty
          ? const Center(
        child: Text('No devices found', style: TextStyle(fontSize: 18)),
      )
          : ListView.builder(
        itemCount: devices.length,
        itemBuilder: (context, index) {
          final device = devices[index].device;
          final rssi = devices[index].rssi;

          return ListTile(
            leading: const Icon(Icons.bluetooth),
            title: Text(device.name.isNotEmpty
                ? device.name
                : 'Unknown Device'),
            subtitle: Text(
                device.remoteId.toString() +
                    ' | RSSI: $rssi dBm'
            ),
            trailing: ElevatedButton(
              child: const Text('Connect'),
              onPressed: () {
                // Handle device connection here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Connecting to ${device.name}...'),
                  ),
                );
              },
            ),
            onTap: () {
              // Handle device selection
            },
          );
        },
      ),
    );
  }
}