import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/Functions/TotalSalesChoiceFunction/ModelClass.dart';

import '../Factory/total_sale_factory.dart';

class MonthlyData implements TotalSale {
  @override
  List<SalesModelClass> salesData = [
    SalesModelClass(position: 0, valueRatio: 50),
    SalesModelClass(position: 1, valueRatio: 80),
    SalesModelClass(position: 2, valueRatio: 30),
    SalesModelClass(position: 3, valueRatio: 60),
    SalesModelClass(position: 4, valueRatio: 20),
    SalesModelClass(position: 5, valueRatio: 90),
    SalesModelClass(position: 6, valueRatio: 40),
    SalesModelClass(position: 7, valueRatio: 70),
    SalesModelClass(position: 8, valueRatio: 10),
    SalesModelClass(position: 9, valueRatio: 50),
    SalesModelClass(position: 10, valueRatio: 75),
    SalesModelClass(position: 11, valueRatio: 65),
  ];


  @override
  Widget getDurationWidget(int position, BuildContext context) {
    // TODO: implement getDurationWidget
    switch (position) {
      case 0:
        return Text('Jan', style: TextStyle(fontSize: 12, color: Theme
            .of(context)
            .textTheme
            .titleMedium
            ?.color));
      case 1:
        return Text('Feb', style: TextStyle(fontSize: 12, color: Theme
            .of(context)
            .textTheme
            .titleMedium
            ?.color));
      case 2:
        return Text('Mar', style: TextStyle(fontSize: 12, color: Theme
            .of(context)
            .textTheme
            .titleMedium
            ?.color));
      case 3:
        return Text('Apr', style: TextStyle(fontSize: 12, color: Theme
            .of(context)
            .textTheme
            .titleMedium
            ?.color));
      case 4:
        return Text('May', style: TextStyle(fontSize: 12, color: Theme
            .of(context)
            .textTheme
            .titleMedium
            ?.color));
      case 5:
        return Text('Jun', style: TextStyle(fontSize: 12, color: Theme
            .of(context)
            .textTheme
            .titleMedium
            ?.color));
      case 6:
        return Text('Jul', style: TextStyle(fontSize: 12, color: Theme
            .of(context)
            .textTheme
            .titleMedium
            ?.color));
      case 7:
        return Text('Aug', style: TextStyle(fontSize: 12, color: Theme
            .of(context)
            .textTheme
            .titleMedium
            ?.color));
      case 8:
        return Text('Sep', style: TextStyle(fontSize: 12, color: Theme
            .of(context)
            .textTheme
            .titleMedium
            ?.color));
      case 9:
        return Text('Oct', style: TextStyle(fontSize: 12, color: Theme
            .of(context)
            .textTheme
            .titleMedium
            ?.color));
      case 10:
        return Text('Nov', style: TextStyle(fontSize: 12, color: Theme
            .of(context)
            .textTheme
            .titleMedium
            ?.color));
      case 11:
        return Text('Dec', style: TextStyle(fontSize: 12, color: Theme
            .of(context)
            .textTheme
            .titleMedium
            ?.color));
      default:
        return Text('', style: TextStyle(fontSize: 12, color: Theme
            .of(context)
            .textTheme
            .titleMedium
            ?.color));
    }
  }
}