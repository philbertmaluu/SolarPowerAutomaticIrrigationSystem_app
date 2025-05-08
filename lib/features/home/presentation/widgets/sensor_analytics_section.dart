import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';

class SensorAnalyticsSection extends StatelessWidget {
  final Map<String, dynamic> sensorData;
  final bool isTablet;

  const SensorAnalyticsSection({
    super.key,
    required this.sensorData,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sensor Analytics',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 16),
        _buildSensorMetrics(context),
        const SizedBox(height: 24),
        _buildHistoricalData(context),
        const SizedBox(height: 24),
        _buildOptimalRanges(context),
        const SizedBox(height: 24),
        _buildWeatherForecast(context),
      ],
    );
  }

  Widget _buildSensorMetrics(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildMetricCard(
                  context,
                  'Humidity',
                  '${sensorData['humidity'] ?? '0'}%',
                  Icons.water_drop,
                  _getHumidityColor(sensorData['humidity'] ?? 0),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildMetricCard(
                  context,
                  'Temp',
                  '${sensorData['temperature'] ?? '0'}°C',
                  Icons.thermostat,
                  _getTemperatureColor(sensorData['temperature'] ?? 0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildMetricCard(
                  context,
                  'Soil Moist',
                  '${sensorData['soilMoisture'] ?? '0'}%',
                  Icons.grass,
                  _getSoilMoistureColor(sensorData['soilMoisture'] ?? 0),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildMetricCard(
                  context,
                  'Light',
                  '${sensorData['lightLevel'] ?? '0'} lux',
                  Icons.light_mode,
                  _getLightLevelColor(sensorData['lightLevel'] ?? 0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoricalData(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Historical Data',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 200,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text('Historical Data Chart Placeholder'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptimalRanges(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Optimal Ranges',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 16),
          _buildRangeIndicator(
            context,
            'Humidity',
            sensorData['humidity'] ?? 0,
            40,
            80,
            '%',
          ),
          const SizedBox(height: 12),
          _buildRangeIndicator(
            context,
            'Temperature',
            sensorData['temperature'] ?? 0,
            15,
            30,
            '°C',
          ),
          const SizedBox(height: 12),
          _buildRangeIndicator(
            context,
            'Soil Moisture',
            sensorData['soilMoisture'] ?? 0,
            30,
            70,
            '%',
          ),
        ],
      ),
    );
  }

  Widget _buildRangeIndicator(
    BuildContext context,
    String title,
    double value,
    double min,
    double max,
    String unit,
  ) {
    final percentage = ((value - min) / (max - min)).clamp(0.0, 1.0);
    final isOptimal = value >= min && value <= max;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '$value$unit',
              style: TextStyle(
                color: isOptimal ? AppColors.primary : AppColors.secondary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            Container(
              height: 8,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Container(
              height: 8,
              width: MediaQuery.of(context).size.width * 0.7 * percentage,
              decoration: BoxDecoration(
                color: isOptimal ? AppColors.primary : AppColors.secondary,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$min$unit',
              style: TextStyle(
                color: AppColors.primary.withOpacity(0.7),
                fontSize: 12,
              ),
            ),
            Text(
              '$max$unit',
              style: TextStyle(
                color: AppColors.primary.withOpacity(0.7),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWeatherForecast(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weather Forecast',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 120,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(child: Text('Weather Forecast Placeholder')),
          ),
        ],
      ),
    );
  }

  Color _getHumidityColor(double value) {
    if (value < 40) return AppColors.secondary;
    if (value > 80) return AppColors.secondary;
    return AppColors.primary;
  }

  Color _getTemperatureColor(double value) {
    if (value < 15) return AppColors.secondary;
    if (value > 30) return AppColors.secondary;
    return AppColors.primary;
  }

  Color _getSoilMoistureColor(double value) {
    if (value < 30) return AppColors.secondary;
    if (value > 70) return AppColors.secondary;
    return AppColors.primary;
  }

  Color _getLightLevelColor(double value) {
    if (value < 1000) return AppColors.secondary;
    if (value > 10000) return AppColors.secondary;
    return AppColors.primary;
  }
}
