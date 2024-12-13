import 'package:flutter/material.dart';
import '../ModelClass.dart';
import '../Factory/total_sale_factory.dart';

// Class for Annual Data
class YearlyData implements TotalSale {
  @override
  List<SalesModelClass> salesData = [
    SalesModelClass(position: 0, valueRatio: 50),
    SalesModelClass(position: 1, valueRatio: 80),
    SalesModelClass(position: 2, valueRatio: 30),
    SalesModelClass(position: 3, valueRatio: 60),
    SalesModelClass(position: 4, valueRatio: 20),
    SalesModelClass(position: 5, valueRatio: 90),
    SalesModelClass(position: 6, valueRatio: 40),
  ];

  // Implementing the abstract method to return the year as a widget
  @override
  Widget getDurationWidget(int position, BuildContext context) {
    switch (position) {
      case 0:
        return Text('2020', style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.titleMedium?.color));
      case 1:
        return Text('2021', style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.titleMedium?.color));
      case 2:
        return Text('2022', style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.titleMedium?.color));
      case 3:
        return Text('2023', style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.titleMedium?.color));
      case 4:
        return Text('2024', style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.titleMedium?.color));
      case 5:
        return Text('2025', style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.titleMedium?.color));
      case 6:
        return Text('2026', style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.titleMedium?.color));
      default:
        return Text('', style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.titleMedium?.color));
    }
  }
}
