import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false, // Disable vertical lines
                drawHorizontalLine: true, // Enable horizontal lines
                horizontalInterval: 200, // Interval for horizontal lines
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.blue.withOpacity(0.3),
                    strokeWidth: 1,
                  );
                },
              ),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 200, // Interval for left Y-axis titles
                    getTitlesWidget: (value, meta) {
                      return Text(
                        '${value.toInt()}',
                        style: TextStyle(fontSize: 7, color: Colors.white),
                      );
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1, // Display a title for every month
                    getTitlesWidget: (value, meta) {
                      switch (value.toInt()) {
                        case 0:
                          return Text('Jan', style: TextStyle(fontSize: 12, color: Colors.white));
                        case 1:
                          return Text('Feb', style: TextStyle(fontSize: 12, color: Colors.white));
                        case 2:
                          return Text('Mar', style: TextStyle(fontSize: 12, color: Colors.white));
                        case 3:
                          return Text('Apr', style: TextStyle(fontSize: 12, color: Colors.white));
                        case 4:
                          return Text('May', style: TextStyle(fontSize: 12, color: Colors.white));
                        case 5:
                          return Text('Jun', style: TextStyle(fontSize: 12, color: Colors.white));
                        case 6:
                          return Text('Jul', style: TextStyle(fontSize: 12, color: Colors.white));
                        case 7:
                          return Text('Aug', style: TextStyle(fontSize: 12, color: Colors.white));
                        case 8:
                          return Text('Sep', style: TextStyle(fontSize: 12, color: Colors.white));
                        case 9:
                          return Text('Oct', style: TextStyle(fontSize: 12, color: Colors.white));
                        case 10:
                          return Text('Nov', style: TextStyle(fontSize: 12, color: Colors.white));
                        case 11:
                          return Text('Dec', style: TextStyle(fontSize: 12, color: Colors.white));
                        default:
                          return Text('', style: TextStyle(fontSize: 12, color: Colors.white));
                      }
                    },
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false), // Hide right Y-axis titles
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false), // Hide top X-axis titles
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(
                  color: Colors.blueGrey, // Set the border color
                  width: 1, // Set the border width
                ),
              ),
              minX: 0, // Min X axis value (Month 1)
              maxX: 11, // Max X axis value (Month 12)
              minY: 0, // Min Y axis value (Start of range)
              maxY: 1200, // Max Y axis value (End of range)
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(0, 200), // Month 1, Value 200
                    FlSpot(1, 400), // Month 2, Value 400
                    FlSpot(2, 600), // Month 3, Value 600
                    FlSpot(3, 800), // Month 4, Value 800
                    FlSpot(4, 1000), // Month 5, Value 1000
                    FlSpot(5, 900), // Month 6, Value 900
                    FlSpot(6, 850), // Month 7, Value 850
                    FlSpot(7, 950), // Month 8, Value 950
                    FlSpot(8, 1100), // Month 9, Value 1100
                    FlSpot(9, 1150), // Month 10, Value 1150
                    FlSpot(10, 1200), // Month 11, Value 1200
                    FlSpot(11, 1000), // Month 12, Value

                  ],
                  isCurved: true,
                  color: Colors.blue,
                  dotData: FlDotData(show: false), // Hide dots
                  belowBarData: BarAreaData(show: true),
                  gradient: LinearGradient(
                    colors: [Colors.blue.withOpacity(0.5), Colors.blue.withOpacity(0.1)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  // Hide the area below the line
                ),
              ],

        ),
      ),
    );
  }
}
