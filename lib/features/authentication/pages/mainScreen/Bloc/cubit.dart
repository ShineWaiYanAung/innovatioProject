import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

class DataImportCubit extends Cubit<String?> {
  DataImportCubit() : super(null); // Initialize with null

  void updateCompanyName(String companyName) {
    emit(companyName);
    print(companyName);
     }
}
