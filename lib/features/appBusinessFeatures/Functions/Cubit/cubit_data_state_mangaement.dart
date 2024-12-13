import 'package:flutter_bloc/flutter_bloc.dart';

import '../TotalSalesChoiceFunction/Factory/total_sale_factory.dart';

class SalesCubit extends Cubit<SaleType> {
  SalesCubit() : super(SaleType.annually);

  void updateSaleType(SaleType newSaleType) {
    emit(newSaleType);
    print(newSaleType);
  }
}