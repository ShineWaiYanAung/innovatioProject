import 'dart:convert';
import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/pages/mainScreen/Bloc/cubit.dart';
import '../../../widgets/data_import_button.dart';
import 'ads_video_page.dart';

class DataImportPage extends StatefulWidget {
  const DataImportPage({super.key});

  @override
  State<DataImportPage> createState() => _DataImportPageState();
}

class _DataImportPageState extends State<DataImportPage> {
  List<Map<String, dynamic>>? dataSendingJSon;
  String? companyName;
  String? filePath;
  bool Alreadyadded = false;

  List<List<dynamic>> _data = [];
  List<String> imageAds = [
    "adsImages/kfcads.jpg",
    "adsImages/savsumg.jpg",
    "adsImages/sneaker.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<DataImportCubit, String?>(
              builder: (context, companyNameData) {
                if (companyNameData == null) {
                  return Text(
                    "Welcome, CEO",
                    style: Theme.of(context).textTheme.titleLarge,
                  );
                } else {

                    companyName = companyNameData;

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
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Enlarge Your Business With FAB',
                  textStyle: Theme.of(context).textTheme.titleMedium,
                  speed: Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 1,
              displayFullTextOnTap: true,
              pause: Duration(milliseconds: 1000),
              stopPauseOnTap: true,
            ),

            ///FontSize need to place Adjustment

            SizedBox(
              height: 20,
            ),

            ///Contact Your ItemCSV Data Import
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
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
                                                      ?.copyWith(
                                                          color: Colors.red),
                                                ),
                                          actions: [
                                            _data.isEmpty
                                                ? TextButton(
                                                    onPressed: () async {
                                                      var result =
                                                          await _pickFile(); // If _pickFile() returns void, this causes the error
                                                      Alreadyadded = true;
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
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  )
                                                : TextButton(
                                                    onPressed: () async {
                                                      final dataSendingCubitkey =
                                                          context.read<
                                                              DataImportCubit>();
                                                      // Ensure companyName is not null before sending to server
                                                      // if (companyName != null &&
                                                      //     companyName!
                                                      //         .isNotEmpty) {
                                                      //   if (dataSendingJSon !=
                                                      //       null) {
                                                      //     dataSendingCubitkey
                                                      //         .sendingToTheServer(
                                                      //             context,
                                                      //             companyName!,
                                                      //             dataSendingJSon!);
                                                      //     _data.clear();
                                                      //     dataSendingJSon
                                                      //         ?.clear();
                                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  FullScreenAdVideo(),));
                                                      //   } else {
                                                      //     print(
                                                      //         "No data available to send.");
                                                      //   }
                                                      // } else {
                                                      //   print(
                                                      //       "Company name is missing.");
                                                      // }
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      "Start",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall
                                                          ?.copyWith(
                                                              color:
                                                                  Colors.black),
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
                                                    ?.copyWith(
                                                        color: Colors.black),
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
                    function: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                title: Text(
                                  "Connect With Your Data Base",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(color: Colors.black),
                                ),
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap:(){
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("Opps,development is on the way,")),
                                        );
                              },
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundImage: AssetImage("Logo/mySql.png"),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap:(){
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("Opps,development is on the way,")),
                                        );
                                      },
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundImage: AssetImage("Logo/odoo.png"),
                                      ),
                                    )
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Close",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                    name: 'Connect',
                    textColor: Colors.white,
                    gradient: [Color(0xff81BCF0), Color(0xff497ADD)],
                    icon: Icon((Icons.share)),
                  ),
                ],
              ),
            ),
          ],
        ),
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
        SnackBar(content: Text("Start is processing...")),
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
}
