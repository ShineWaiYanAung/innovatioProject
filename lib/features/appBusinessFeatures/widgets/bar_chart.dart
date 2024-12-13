import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/Functions/Cubit/cubit_data_state_mangaement.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/Functions/TotalSalesChoiceFunction/Factory/total_sale_factory.dart';

class BarChartSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesCubit, SaleType>(
      builder: (context, saleType) {
        List<BarChartGroupData> groupData = [];
        TotalSale saleData = TotalSaleFactory.getTotalSaleData(saleType);

        // Ensure that salesData is not null and contains the necessary information
        if (saleData != null && saleData.salesData != null) {
          for (var eachSaleData in saleData.salesData) {
            // Check that position and valueRatio are not null
            if (eachSaleData.position != null && eachSaleData.valueRatio != null) {
              final eachGroupData = makeGroupData(eachSaleData.position, eachSaleData.valueRatio);
              groupData.add(eachGroupData);
            }
          }
        }

        // Ensure that we have valid group data before rendering the chart
        if (groupData.isEmpty) {
          return Center(
            child: Text(
              'No Data Available',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }

        return BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 100,
            barGroups: groupData,
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 20,
                  reservedSize: 40,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      '${value.toInt()}',
                      style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.titleMedium?.color),
                    );
                  },
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false), // Hide right Y-axis
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false), // Hide top titles
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    return saleData.getDurationWidget(value.toInt(), context);
                  },
                  reservedSize: 40,
                ),
              ),
            ),
            // Show border with custom color
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: Colors.blueGrey, // Set the border color
                width: 2, // Set the border width
              ),
            ),
            gridData: FlGridData(
              show: true,
              horizontalInterval: 20,
              drawHorizontalLine: true, // Enable horizontal lines
              drawVerticalLine: false, // Disable vertical lines
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Colors.green.withOpacity(0.5), // Set horizontal line color
                  strokeWidth: 1,
                );
              },
            ),
          ),
        );
      },
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: Colors.blueAccent,
          width: 10,
          borderRadius: BorderRadius.circular(4), // Rounded bars
        ),
      ],
    );
  }
}
