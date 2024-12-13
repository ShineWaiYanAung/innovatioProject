import 'package:flutter/cupertino.dart';

import '../ModelClass.dart';
import '../annual/annually.dart';
import '../daily/daily.dart';
import '../monthly/monthy.dart';

enum SaleType { annually, monthly, daily }

abstract class TotalSale {
  List<SalesModelClass> salesData = [];
  Widget getDurationWidget(int position, BuildContext context);
}

class TotalSaleFactory {
  static TotalSale getTotalSaleData(SaleType type) {
    switch (type) {
      case SaleType.annually:
        return YearlyData();
      case SaleType.monthly:
        return MonthlyData();
      case SaleType.daily:
        return DailyData();
      default:
        throw Exception("Invalid sale type");
    }
  }
}
