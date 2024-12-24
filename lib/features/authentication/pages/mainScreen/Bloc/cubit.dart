import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';  // For JSON encoding/decoding

class DataImportCubit extends Cubit<String?> {
  DataImportCubit() : super(null); // Initialize with null

  void updateCompanyName(String companyName) {
    emit(companyName);
    print(companyName);
  }

  Future<void> sendingToTheServer(BuildContext context,String companyName, List<Map<String, dynamic>> data) async {
    final Uri uri = Uri.parse("https://e322-103-200-134-53.ngrok-free.app/create/?company_name=$companyName"); // Define your URI
    final beforeData = {companyName : data};
    final bodyData2 = jsonEncode(beforeData);
    final bodyData = json.encode(data); // Encode the data to JSON format

    try {
      final response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "ngrok-skip-browser-warning": "true",
          "User-Agent": "CustomUserAgent"
        },
        body: bodyData2,
      );

      if (response.statusCode == 200) {
        print('Data sent successfully');
      } else {
        print('Failed to send data: ${response.statusCode}');

      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.black12,
          content: Text(e.toString(),style: Theme.of(context).textTheme.titleMedium,)));
      return
      print('Error: $e');
    }
  }
}



class SaleData {
  final String invoiceId; // Invoice ID
  final String customerId; // Customer ID
  final String gender; // Gender
  final String productName; // Product Name
  final String category; // Category
  final double unitPrice; // Unit price
  final int quantity; // Quantity
  final double tax; // Tax 5%
  final double total; // Total
  final String orderDate; // Date
  final String paymentMethod; // Payment Method

  SaleData({
    required this.invoiceId,
    required this.customerId,
    required this.gender,
    required this.productName,
    required this.category,
    required this.unitPrice,
    required this.quantity,
    required this.tax,
    required this.total,
    required this.orderDate,
    required this.paymentMethod,
  });

  // Factory constructor to create SaleData from CSV row
  factory SaleData.fromCsv(List<dynamic> csvRow) {
    // Make sure row has the expected number of columns
    if (csvRow.length < 11) {
      throw Exception('Invalid CSV row: ${csvRow.join(', ')}');
    }
    return SaleData(
      invoiceId: csvRow[0].toString(), // Invoice ID
      customerId: csvRow[1].toString(), // Customer ID
      gender: csvRow[2].toString(), // Gender
      productName: csvRow[3].toString(), // Product Name
      category: csvRow[4].toString(), // Category
      unitPrice: double.tryParse(csvRow[5].toString()) ?? 0.0, // Unit price
      quantity: int.tryParse(csvRow[6].toString()) ?? 0, // Quantity
      tax: double.tryParse(csvRow[7].toString()) ?? 0.0, // Tax 5%
      total: double.tryParse(csvRow[8].toString()) ?? 0.0, // Total
      orderDate: csvRow[9].toString(), // Date
      paymentMethod: csvRow[10].toString(), // Payment Method
    );
  }

  // Convert SaleData to JSON format
  Map<String, dynamic> toJson() {
    return {
      'invoiceId': invoiceId,
      'customerId': customerId,
      'gender': gender,
      'productName': productName,
      'category': category,
      'unitPrice': unitPrice,
      'quantity': quantity,
      'tax': tax,
      'total': total,
      'orderDate': orderDate,
      'paymentMethod': paymentMethod,
    };
  }
}
