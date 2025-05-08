import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), elevation: 0),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(context, 'System Settings', [
            _buildSettingTile(
              context,
              'System Name',
              'SPAIS',
              Icons.label,
              onTap: () {
                // TODO: Implement system name change
              },
            ),
            _buildSettingTile(
              context,
              'Location',
              'Field 1',
              Icons.location_on,
              onTap: () {
                // TODO: Implement location change
              },
            ),
            _buildSettingTile(
              context,
              'Time Zone',
              'UTC+0',
              Icons.access_time,
              onTap: () {
                // TODO: Implement timezone change
              },
            ),
          ]),
          const SizedBox(height: 24),
          _buildSection(context, 'Irrigation Settings', [
            _buildSettingTile(
              context,
              'Watering Schedule',
              'Daily at 6:00 AM',
              Icons.schedule,
              onTap: () {
                // TODO: Implement schedule change
              },
            ),
            _buildSettingTile(
              context,
              'Moisture Threshold',
              '40%',
              Icons.water_drop,
              onTap: () {
                // TODO: Implement threshold change
              },
            ),
            _buildSettingTile(
              context,
              'Watering Duration',
              '30 minutes',
              Icons.timer,
              onTap: () {
                // TODO: Implement duration change
              },
            ),
          ]),
          const SizedBox(height: 24),
          _buildSection(context, 'Notifications', [
            _buildSwitchTile(
              context,
              'System Alerts',
              'Receive alerts about system status',
              Icons.notifications,
              true,
              onChanged: (value) {
                // TODO: Implement notification toggle
              },
            ),
            _buildSwitchTile(
              context,
              'Maintenance Reminders',
              'Get notified about maintenance',
              Icons.build,
              true,
              onChanged: (value) {
                // TODO: Implement maintenance notifications
              },
            ),
            _buildSwitchTile(
              context,
              'Weather Alerts',
              'Get weather-based notifications',
              Icons.cloud,
              false,
              onChanged: (value) {
                // TODO: Implement weather alerts
              },
            ),
          ]),
          const SizedBox(height: 24),
          _buildSection(context, 'Account', [
            _buildSettingTile(
              context,
              'Profile',
              'View and edit profile',
              Icons.person,
              onTap: () {
                // TODO: Navigate to profile
              },
            ),
            _buildSettingTile(
              context,
              'Security',
              'Change password and security settings',
              Icons.security,
              onTap: () {
                // TODO: Navigate to security settings
              },
            ),
            _buildSettingTile(
              context,
              'Logout',
              '',
              Icons.logout,
              onTap: () {
                // TODO: Implement logout
              },
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Card(child: Column(children: children)),
      ],
    );
  }

  Widget _buildSettingTile(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon, {
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title),
      subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    bool value, {
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      secondary: Icon(icon, color: AppColors.primary),
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }
}
