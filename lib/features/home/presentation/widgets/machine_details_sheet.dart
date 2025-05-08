import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'solar_analytics_section.dart';
import 'sensor_analytics_section.dart';

class MachineDetailsSheet extends StatelessWidget {
  final Map<String, dynamic> device;
  final bool isTablet;

  const MachineDetailsSheet({
    super.key,
    required this.device,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: AppColors.secondary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  _getDeviceIcon(device['type']),
                  color: AppColors.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      device['name'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Status: ${device['status'].toUpperCase()}',
                      style: TextStyle(
                        color:
                            device['status'] == 'online'
                                ? AppColors.primary
                                : AppColors.secondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: device['isActive'],
                onChanged: (value) {
                  // TODO: Implement device toggle
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Device-specific analytics
          if (device['type'] == 'solar')
            SolarAnalyticsSection(device: device, isTablet: isTablet)
          else if (device['type'] == 'sensor')
            SensorAnalyticsSection(
              sensorData: {
                'humidity':
                    double.tryParse(
                      device['humidity']?.toString().replaceAll('%', '') ?? '0',
                    ) ??
                    0.0,
                'temperature':
                    double.tryParse(
                      device['temperature']?.toString().replaceAll('°C', '') ??
                          '0',
                    ) ??
                    0.0,
                'soilMoisture': (device['soilMoisture'] ?? 0.0).toDouble(),
                'lightLevel': (device['lightLevel'] ?? 0.0).toDouble(),
              },
              isTablet: isTablet,
            )
          else
            _buildAnalyticsGrid(context),
          const SizedBox(height: 24),
          // Usage Statistics
          const Text(
            'Usage Statistics',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildUsageChart(context),
          const SizedBox(height: 24),
          // Scheduling Section
          const Text(
            'Scheduling',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildSchedulingControls(context),
          const SizedBox(height: 24),
          // Maintenance Section
          const Text(
            'Maintenance',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildMaintenanceInfo(context),
          const SizedBox(height: 24),
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Implement maintenance history
                  },
                  icon: const Icon(Icons.history),
                  label: const Text('Maintenance History'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Implement settings
                  },
                  icon: const Icon(Icons.settings),
                  label: const Text('Settings'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAnalyticsGrid(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: [
        _buildAnalyticsCard(
          context,
          'Flow Rate',
          '${device['flow'] ?? '--'}',
          Icons.water_drop,
          Colors.blue,
        ),
        _buildAnalyticsCard(
          context,
          'Power',
          '${device['power'] ?? '--'}',
          Icons.power,
          Colors.orange,
        ),
        _buildAnalyticsCard(
          context,
          'Efficiency',
          '${device['efficiency'] ?? '--'}',
          Icons.speed,
          Colors.green,
        ),
        _buildAnalyticsCard(
          context,
          'Uptime',
          '98%',
          Icons.timer,
          Colors.purple,
        ),
      ],
    );
  }

  Widget _buildAnalyticsCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 20),
          const Spacer(),
          Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildUsageChart(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(child: Text('Usage Chart Placeholder')),
    );
  }

  Widget _buildSchedulingControls(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.access_time),
            title: const Text('Daily Schedule'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Implement schedule settings
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.autorenew),
            title: const Text('Automation Rules'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Implement automation settings
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMaintenanceInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.orange[700]),
              const SizedBox(width: 8),
              Text(
                'Maintenance Due',
                style: TextStyle(
                  color: Colors.orange[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Next maintenance is due in 7 days',
            style: TextStyle(color: Colors.orange[700]),
          ),
        ],
      ),
    );
  }

  IconData _getDeviceIcon(String type) {
    switch (type) {
      case 'pump':
        return Icons.water;
      case 'solar':
        return Icons.solar_power;
      case 'sensor':
        return Icons.sensors;
      default:
        return Icons.device_unknown;
    }
  }
}
