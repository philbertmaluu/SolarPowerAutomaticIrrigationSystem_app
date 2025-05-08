import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Devices'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Implement add device
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildDeviceCategory(context, 'Pumps', [
            _buildDeviceTile(
              context,
              'Main Water Pump',
              'Online',
              Icons.water,
              Colors.blue,
              true,
            ),
            _buildDeviceTile(
              context,
              'Backup Pump',
              'Offline',
              Icons.water,
              Colors.blue,
              false,
            ),
          ]),
          const SizedBox(height: 24),
          _buildDeviceCategory(context, 'Solar Panels', [
            _buildDeviceTile(
              context,
              'Solar Array 1',
              'Online',
              Icons.solar_power,
              Colors.orange,
              true,
            ),
            _buildDeviceTile(
              context,
              'Solar Array 2',
              'Online',
              Icons.solar_power,
              Colors.orange,
              true,
            ),
          ]),
          const SizedBox(height: 24),
          _buildDeviceCategory(context, 'Sensors', [
            _buildDeviceTile(
              context,
              'Field Sensor 1',
              'Online',
              Icons.sensors,
              Colors.green,
              true,
            ),
            _buildDeviceTile(
              context,
              'Field Sensor 2',
              'Offline',
              Icons.sensors,
              Colors.green,
              false,
            ),
            _buildDeviceTile(
              context,
              'Weather Station',
              'Online',
              Icons.cloud,
              Colors.cyan,
              true,
            ),
          ]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement add device
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildDeviceCategory(
    BuildContext context,
    String title,
    List<Widget> devices,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...devices,
      ],
    );
  }

  Widget _buildDeviceTile(
    BuildContext context,
    String name,
    String status,
    IconData icon,
    Color color,
    bool isOnline,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
          status,
          style: TextStyle(color: isOnline ? Colors.green : Colors.grey),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Switch(
              value: isOnline,
              onChanged: (value) {
                // TODO: Implement device toggle
              },
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: () {
                // TODO: Navigate to device details
              },
            ),
          ],
        ),
      ),
    );
  }
}
