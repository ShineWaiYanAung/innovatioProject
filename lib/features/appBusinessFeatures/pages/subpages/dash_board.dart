import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/widgets/stock_chart.dart';
import 'package:file_picker/file_picker.dart';
import '../../../authentication/pages/mainScreen/Bloc/cubit.dart';
import '../../widgets/bar_chart.dart';
import '../../widgets/data_import_button.dart';
import '../../widgets/line_chart.dar.dart';
import '../../widgets/radio_top_product_sale.dart';
import '../../widgets/radio_total_sales.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<List<dynamic>> _data = [];

  List<Map<String, dynamic>>? dataSendingJSon;
  String? companyName;
  String? filePath;
  bool Alreadyadded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          BlocBuilder<DataImportCubit, String?>(
            builder: (context, companyNameData) {
              if (companyName == null) {
                return Text(
                  "Welcome, CEO",
                  style: Theme.of(context).textTheme.titleLarge,
                );
              } else {
                // Display company name if it's available
                return Text(
                  "Welcome, CEO of $companyName",
                  style: Theme.of(context).textTheme.titleLarge,
                );
              }
            },
          ),

          SizedBox(
            height: 10,
          ),

          ///FontSize need to place Adjustment
          Text(
            "Review Your Data",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20,
          ),

          ///Contact Your ItemCSV Data Import
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<DataImportCubit, String?>(
                builder: (BuildContext context, companyNameMain) {
                  return DataImportButton(
                    function: Alreadyadded
                        ? () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.black12,
                                content: Text(
                                  "Your Data is Already Added Plz Wait",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            );
                          }
                        : () {
                            setState(() {
                              companyName = companyNameMain;
                            });
                            showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return AlertDialog(
                                      backgroundColor: Colors.white,
                                      title: Text(
                                        "Your CSV Data Uploading..",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(color: Colors.black),
                                      ),
                                      content: _data.isNotEmpty
                                          ? Text(
                                              "Your Data is here",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                      color: Colors.green),
                                            )
                                          : Text(
                                              "Data haven't uploaded",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(color: Colors.red),
                                            ),
                                      actions: [
                                        _data.isEmpty
                                            ? TextButton(
                                                onPressed: () async {
                                                  var result =
                                                      await _pickFile(); // If _pickFile() returns void, this causes the error
                                                  Alreadyadded =true;
                                                  print(Alreadyadded);
                                                  setState(
                                                      () {}); // Updates the StatefulBuilder
                                                },
                                                child: Text(
                                                  "Upload",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall
                                                      ?.copyWith(
                                                          color: Colors.black),
                                                ),
                                              )
                                            : TextButton(
                                                onPressed: () async {
                                                  convertCsvToJson(_data);
                                                  final dataSendingCubitkey =
                                                      context.read<
                                                          DataImportCubit>();
                                                  // Ensure companyName is not null before sending to server
                                                  if (companyName != null &&
                                                      companyName!.isNotEmpty) {
                                                    if (dataSendingJSon !=
                                                        null) {
                                                      dataSendingCubitkey
                                                          .sendingToTheServer(
                                                              context,
                                                              companyName!,
                                                              dataSendingJSon!);
                                                      _data.clear();
                                                      dataSendingJSon?.clear();
                                                      Navigator.of(context)
                                                          .pop();

                                                    } else {
                                                      print(
                                                          "No data available to send.");
                                                    }
                                                  } else {
                                                    print(
                                                        "Company name is missing.");
                                                  }
                                                  setState(() {});
                                                },
                                                child: Text(
                                                  "Start",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall
                                                      ?.copyWith(
                                                          color: Colors.black),
                                                ),
                                              ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            "Close",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                                ?.copyWith(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                    name: 'Import',
                    textColor: Colors.black,
                    gradient: [Colors.white, Colors.white],
                    icon: Icon(Icons.download),
                  );
                },
              ),
              DataImportButton(
                function: () {},
                name: 'Connect',
                textColor: Colors.white,
                gradient: [Color(0xff81BCF0), Color(0xff497ADD)],
                icon: Icon((Icons.share)),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey,
            thickness: 3,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;

    try {
      if (kIsWeb) {
        // For web, use bytes
        final bytes = result.files.first.bytes;
        if (bytes == null) {
          throw Exception("No file data available.");
        }
        final csvData = utf8.decode(bytes);
        final fields = const CsvToListConverter().convert(csvData);

        setState(() {
          _data = fields;
        });
      } else {
        // For non-web platforms, use path
        filePath = result.files.first.path;
        final input = File(filePath!).openRead();
        final fields = await input
            .transform(utf8.decoder)
            .transform(const CsvToListConverter())
            .toList();

        setState(() {
          _data = fields;
        });
      }
    } catch (e) {
      print("Error parsing file: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error reading file: $e")),
      );
    }
  }

  void convertCsvToJson(List<List<dynamic>> csvData) {
    List<Map<String, dynamic>> saleDataList = [];

    // Skipping the header row (index 0) and converting CSV rows into SaleData
    for (var row in csvData.skip(1)) {
      saleDataList
          .add(SaleData.fromCsv(row).toJson()); // Convert SaleData to JSON
    }

    // Assign the List<Map<String, dynamic>> to dataSendingJSon
    dataSendingJSon = saleDataList;

    // Print the result to check the structure before sending
    print("Data to send: ${jsonEncode(dataSendingJSon)}");
  }

// void convertCsvToJson(List<List<dynamic>> csvData) {
  //   List<SaleData> saleDataList = [];
  //
  //   // Skipping the header row (index 0) and converting CSV rows into SaleData
  //   for (var row in csvData.skip(1)) {
  //     saleDataList.add(SaleData.fromCsv(row));
  //   }
  //
  //   // Convert SaleData list to JSON format
  //   List<Map<String, dynamic>> jsonData =
  //       saleDataList.map((data) => jsonEncode(data.toJson())).toList();
  //   dataSendingJSon = jsonData;
  //   print(dataSendingJSon);
  //   // Output JSON data (you can return or do other processing here)
  //   // for (var json in jsonData) {
  //   //   print(json); // You can replace this with any other functionality you need
  //   // }
  // }
}
