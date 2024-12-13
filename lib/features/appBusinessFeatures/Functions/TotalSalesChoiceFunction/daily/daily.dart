import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/Functions/TotalSalesChoiceFunction/ModelClass.dart';

import '../Factory/total_sale_factory.dart';

class DailyData implements TotalSale {
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

  @override
  Widget getDurationWidget(int position, BuildContext context) {
    switch (position) {
      case 0:
        return Text('Mon', style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.titleMedium?.color));
      case 1:
        return Text('Tue', style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.titleMedium?.color));
      case 2:
        return Text('Wed', style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.titleMedium?.color));
      case 3:
        return Text('Thu', style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.titleMedium?.color));
      case 4:
        return Text('Fri', style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.titleMedium?.color));
      case 5:
        return Text('Sat', style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.titleMedium?.color));
      case 6:
        return Text('Sun', style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.titleMedium?.color));
      default:
        return Text('', style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.titleMedium?.color));
    }
  }
}
