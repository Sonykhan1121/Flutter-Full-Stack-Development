import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';


class SearchingScreen extends StatefulWidget {
  const SearchingScreen({Key? key}) : super(key: key);

  @override
  State<SearchingScreen> createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen> {
  bool _isSearching = true;
  List<BluetoothDevice> _devices = [];

  @override
  void initState() {
    super.initState();
    _startDiscovery();
  }

  @override
  void dispose() {
    // Make sure to stop discovery when leaving the screen
    FlutterBluetoothSerial.instance.cancelDiscovery();
    super.dispose();
  }

  Future<void> _startDiscovery() async {
    setState(() {
      _isSearching = true;
      _devices = [];
    });

    try {
      // First check if already paired devices are available
      List<BluetoothDevice> bondedDevices = await FlutterBluetoothSerial.instance.getBondedDevices();
      if (bondedDevices.isNotEmpty) {
        setState(() {
          _devices = bondedDevices;
        });
      }

      // Now search for new devices
      FlutterBluetoothSerial.instance.startDiscovery().listen((result) {
        // Add device if it's not already in the list
        if (!_devices.any((device) => device.address == result.device.address)) {
          setState(() {
            _devices.add(result.device);
          });
        }
      }).onDone(() {
        setState(() {
          _isSearching = false;
        });
      });

      // Set a timeout for discovery
      Future.delayed(const Duration(seconds: 30), () {
        if (mounted) {
          setState(() {
            _isSearching = false;
          });
        }
      });
    } catch (e) {
      setState(() {
        _isSearching = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error discovering devices: $e'),
            action: SnackBarAction(
              label: 'Retry',
              onPressed: _startDiscovery,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Device'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _isSearching
          ? const SearchingView()
          : DeviceListView(devices: _devices),
      floatingActionButton: FloatingActionButton(
        onPressed: _startDiscovery,
        child: Icon(_isSearching ? Icons.stop : Icons.refresh),
      ),
    );
  }
}

class SearchingView extends StatelessWidget {
  const SearchingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Pulsating animation container similar to your image
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              boxShadow: [
                for (var i = 0; i < 4; i++)
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3 - i * 0.05),
                    spreadRadius: 20.0 * (i + 1),
                    blurRadius: 20.0,
                  ),
              ],
            ),
            child: Center(
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'Searching...',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          const Text(
            'Looking for Bluetooth devices nearby',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class DeviceListView extends StatelessWidget {
  final List<BluetoothDevice> devices;

  const DeviceListView({Key? key, required this.devices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (devices.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.bluetooth_disabled,
              size: 80,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            const Text(
              'No devices found',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            const Text(
              'Try moving closer to your device or refresh',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchingScreen()),
                );
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      itemCount: devices.length,
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final device = devices[index];
        return Card(
          elevation: 2,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade50,
              child: Icon(
                device.isConnected ? Icons.bluetooth_connected : Icons.bluetooth,
                color: Colors.blue,
              ),
            ),
            title: Text(
              device.name ?? 'Unknown Device',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(device.address),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeviceDetailPage(device: device),
                  ),
                );
              },
              child: Text(device.isConnected ? 'View' : 'Connect'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeviceDetailPage(device: device),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class DeviceDetailPage extends StatelessWidget {
  final BluetoothDevice device;

  const DeviceDetailPage({Key? key, required this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(device.name ?? 'Unknown Device'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Device Info',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    InfoRow(title: 'Name', value: device.name ?? 'Unknown'),
                    InfoRow(title: 'Address', value: device.address),
                    InfoRow(
                      title: 'Type',
                      value: device.type.toString().split('.').last,
                    ),
                    InfoRow(
                      title: 'Status',
                      value: device.isConnected ? 'Connected' : 'Not Connected',
                      valueColor: device.isConnected ? Colors.green : Colors.red,
                    ),
                    InfoRow(
                      title: 'Bonded',
                      value: device.isBonded ? 'Yes' : 'No',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                onPressed: () {
                  // Connect to device logic would go here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Connecting to ${device.name ?? "device"}...'),
                    ),
                  );
                },
                icon: const Icon(Icons.bluetooth_connected),
                label: Text(device.isConnected ? 'Disconnect' : 'Connect'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String value;
  final Color? valueColor;

  const InfoRow({
    Key? key,
    required this.title,
    required this.value,
    this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$title: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}