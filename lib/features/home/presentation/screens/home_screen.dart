import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../widgets/machine_details_sheet.dart';
import '../../../profile/presentation/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _devices = [
    {
      'name': 'Main Water Pump',
      'status': 'online',
      'type': 'pump',
      'power': '2.5 kW',
      'flow': '120 L/min',
      'isActive': true,
    },
    {
      'name': 'Solar Panel Array',
      'status': 'online',
      'type': 'solar',
      'power': '3.2 kW',
      'efficiency': '85%',
      'isActive': true,
    },
    {
      'name': 'Field Sensor 1',
      'status': 'online',
      'type': 'sensor',
      'temperature': '28°C',
      'humidity': '65%',
      'soilMoisture': 45.0,
      'lightLevel': 5000.0,
      'isActive': true,
    },
    {
      'name': 'Field Sensor 2',
      'status': 'offline',
      'type': 'sensor',
      'temperature': '--',
      'humidity': '--',
      'soilMoisture': 0.0,
      'lightLevel': 0.0,
      'isActive': false,
    },
  ];

  String _searchQuery = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;
    final isLandscape = screenSize.width > screenSize.height;

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.secondary,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 30,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'john.doe@example.com',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.analytics_outlined),
              title: const Text('Analytics'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to Analytics
              },
            ),
            ListTile(
              leading: const Icon(Icons.devices_outlined),
              title: const Text('Devices'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to Devices
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to Settings
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('Help & Support'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to Help & Support
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
                // TODO: Implement logout
              },
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: isTablet ? 280.0 : 320.0,
            pinned: true,
            stretch: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Theme.of(context).colorScheme.primary,
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // App Bar Title
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: AppColors.secondary,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.water_drop,
                                    size: 24,
                                    color: AppColors.primary,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'SPAIS',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.person_outline,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => const ProfileScreen(),
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.settings_outlined,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    // TODO: Navigate to settings
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Overview Cards
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child:
                              isTablet
                                  ? Row(
                                    children: [
                                      Expanded(
                                        child: _buildOverviewCard(
                                          'Total Power',
                                          '5.7 kW',
                                          Icons.power,
                                          AppColors.primary,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: _buildOverviewCard(
                                          'Water Flow',
                                          '120 L/min',
                                          Icons.water_drop,
                                          Colors.blue,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: _buildOverviewCard(
                                          'Avg. Temperature',
                                          '28°C',
                                          Icons.thermostat,
                                          Colors.orange,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: _buildOverviewCard(
                                          'Avg. Humidity',
                                          '65%',
                                          Icons.water,
                                          Colors.cyan,
                                        ),
                                      ),
                                    ],
                                  )
                                  : Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: _buildOverviewCard(
                                              'Total Power',
                                              '5.7 kW',
                                              Icons.power,
                                              AppColors.primary,
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: _buildOverviewCard(
                                              'Water Flow',
                                              '120 L/min',
                                              Icons.water_drop,
                                              Colors.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: _buildOverviewCard(
                                              'Avg. Temperature',
                                              '28°C',
                                              Icons.thermostat,
                                              Colors.orange,
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: _buildOverviewCard(
                                              'Avg. Humidity',
                                              '65%',
                                              Icons.water,
                                              Colors.cyan,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Device List
          SliverPadding(
            padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final device = _devices[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: isTablet ? 16.0 : 12.0),
                  child: _buildDeviceCard(device, isTablet),
                );
              }, childCount: _devices.length),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceCard(Map<String, dynamic> device, bool isTablet) {
    final bool isOnline = device['status'] == 'online';
    final Color statusColor = isOnline ? Colors.green : Colors.red;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder:
              (context) => DraggableScrollableSheet(
                initialChildSize: 0.9,
                minChildSize: 0.5,
                maxChildSize: 0.95,
                builder:
                    (context, scrollController) => SingleChildScrollView(
                      controller: scrollController,
                      child: MachineDetailsSheet(
                        device: device,
                        isTablet: isTablet,
                      ),
                    ),
              ),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(isTablet ? 20.0 : 16.0),
          child: Row(
            children: [
              // Status indicator and device info
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: isTablet ? 14 : 12,
                          height: isTablet ? 14 : 12,
                          decoration: BoxDecoration(
                            color: statusColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            device['name'],
                            style: TextStyle(
                              fontSize: isTablet ? 18 : 16,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (device['type'] == 'pump') ...[
                      _buildInfoRow('Power', device['power'], isTablet),
                      _buildInfoRow('Flow', device['flow'], isTablet),
                    ] else if (device['type'] == 'solar') ...[
                      _buildInfoRow('Power', device['power'], isTablet),
                      _buildInfoRow(
                        'Efficiency',
                        device['efficiency'],
                        isTablet,
                      ),
                    ] else if (device['type'] == 'sensor') ...[
                      _buildInfoRow(
                        'Temperature',
                        device['temperature'],
                        isTablet,
                      ),
                      _buildInfoRow('Humidity', device['humidity'], isTablet),
                      if (device['soilMoisture'] != null)
                        _buildInfoRow(
                          'Soil Moisture',
                          '${device['soilMoisture']}%',
                          isTablet,
                        ),
                      if (device['lightLevel'] != null)
                        _buildInfoRow(
                          'Light Level',
                          '${device['lightLevel']} lux',
                          isTablet,
                        ),
                    ],
                  ],
                ),
              ),
              // Device control
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Switch(
                      value: device['isActive'],
                      onChanged: (value) {
                        setState(() {
                          device['isActive'] = value;
                        });
                      },
                    ),
                    const SizedBox(height: 8),
                    Text(
                      device['isActive'] ? 'Active' : 'Inactive',
                      style: TextStyle(
                        fontSize: isTablet ? 14 : 12,
                        color: device['isActive'] ? Colors.green : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, bool isTablet) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: isTablet ? 16 : 14, color: Colors.grey),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTablet ? 16 : 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
