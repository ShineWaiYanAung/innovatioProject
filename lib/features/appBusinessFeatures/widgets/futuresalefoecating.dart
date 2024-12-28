import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class FutureSaleForecastingOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          backgroundColor: Colors.black, // Set the background to black
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  if (value % 100 == 0) {
                    return Text(
                      value.toInt().toString(),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    );
                  }
                  return Container();
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  final monthNames = [
                    'Jan',
                    'Feb',
                    'Mar',
                    'Apr',
                    'May',
                    'Jun',
                    'Jul',
                    'Aug',
                    'Sep',
                    'Oct',
                    'Nov',
                    'Dec'
                  ];

                  // Ensure all months are displayed by adjusting the title for each index
                  int index = value.toInt().toInt(); // Ensure it is a valid integer for month index
                  if (index >= 0 && index < 12) {
                    return Text(
                      monthNames[index], // Display month name
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    );
                  }
                  return Container();
                },
              ),
            ),
            // Disable top and right titles
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            drawHorizontalLine: true,
            horizontalInterval: 100, // Adjust interval for y-axis
            verticalInterval: 1, // Set interval for x-axis
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.white,
                strokeWidth: 1,
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.white,
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.white, width: 2),
          ),
          // Set minY and maxY values based on your desired range
          lineBarsData: [
            _buildLineBarData(
              color: Colors.blue,
              spots: [
                FlSpot(0, 10),
                FlSpot(1, 30),
                FlSpot(2, 50),
                FlSpot(3, 40),
                FlSpot(4, 70),
                FlSpot(5, 90),
                FlSpot(6, 70),
                FlSpot(7, 90),
                FlSpot(8, 120),
                FlSpot(9, 130),
                FlSpot(10, 150),
                FlSpot(11, 170),
              ],
            ),
            _buildLineBarData(
              color: Colors.green,
              spots: [
                FlSpot(0, 20),
                FlSpot(1, 40),
                FlSpot(2, 30),
                FlSpot(3, 80),
                FlSpot(4, 60),
                FlSpot(5, 100),
                FlSpot(6, 50),
                FlSpot(7, 40),
                FlSpot(8, 90),
                FlSpot(9, 110),
                FlSpot(10, 120),
                FlSpot(11, 150),
              ],
            ),
          ],
          minY: 0, // Set the minimum y-axis value
          maxY: 200, // Set the maximum y-axis value (adjust according to your data)
        ),
      ),
    );
  }

  LineChartBarData _buildLineBarData({
    required Color color,
    required List<FlSpot> spots,
  }) {
    return LineChartBarData(
      isCurved: true,
      color: color,
      barWidth: 4,
      isStrokeCapRound: true,
      belowBarData: BarAreaData(show: false),
      spots: spots,
    );
  }
}
