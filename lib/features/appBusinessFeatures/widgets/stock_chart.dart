import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StockBarChart extends StatelessWidget {
  const StockBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceEvenly,
          maxY: 3, // 3 levels: Stock Loss, Stock Medium, Stock Over
          barTouchData: BarTouchData(enabled: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 1:
                      return const Text('Loss',
                          style: TextStyle(color: Colors.red, fontSize: 10));
                    case 2:
                      return const Text('Medium',
                          style: TextStyle(color: Colors.green, fontSize: 10));
                    case 3:
                      return const Text('Over',
                          style: TextStyle(color: Colors.orange, fontSize: 10));
                    default:
                      return const SizedBox();
                  }
                },
                interval: 1,
                reservedSize: 40,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const months = [
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
                  return Text(months[value.toInt()],
                      style:
                      const TextStyle(color: Colors.white, fontSize: 10));
                },
                interval: 1,
                reservedSize: 24,
              ),
            ),
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
            verticalInterval: 1, // Add vertical grid lines at each bar
            horizontalInterval: 1, // Add horizontal grid lines for Y-axis values
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.5),
                strokeWidth: 1,
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.5),
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(
              color: Colors.blueGrey, // Set the border color
              width: 2, // Set the border width
            ),
          ),
          barGroups: [
            for (int i = 0; i < 12; i++)
              BarChartGroupData(
                x: i,
                barRods: [
                  BarChartRodData(
                    toY: (i % 3) + 1, // Cycle between Stock Loss, Medium, Over
                    color: (i % 3) == 0
                        ? Colors.red
                        : (i % 3) == 1
                        ? Colors.green
                        : Colors.orange,
                    width: 10,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
