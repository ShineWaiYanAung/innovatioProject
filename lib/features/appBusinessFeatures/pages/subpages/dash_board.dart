import 'dart:convert';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/pages/subpages/subsubPage/customer_segementaiton_detail.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/pages/subpages/subsubPage/trending_page.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/widgets/stock_chart.dart';
import 'package:file_picker/file_picker.dart';
import '../../../authentication/pages/mainScreen/Bloc/cubit.dart';
import '../../widgets/bar_chart.dart';
import '../../widgets/data_import_button.dart';
import '../../widgets/futuresalefoecating.dart';
import '../../widgets/line_chart.dar.dart';
import '../../widgets/radio_top_product_sale.dart';
import '../../widgets/radio_total_sales.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          BlocBuilder<DataImportCubit, String?>(
            builder: (context, companyNameData) {
              companyName = companyNameData;
              if (companyNameData == null) {
                return Text(
                  "Welcome, CEO",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 24),
                );
              } else {
                // Display company name if it's available
                return Text(
                  "Welcome, CEO of $companyName",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 20),
                );
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 50,
            margin: EdgeInsets.only(right: 250),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(20)),
            child: Text("Save",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 15,
                    )),
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
          ///FontSize need to place Adjustment
          SizedBox(
            height: 20,
          ),
          Text(
            "Trending Market For You",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: 20,
          ),
          CarouselSlider.builder(
            itemCount: imageAds.length,
            itemBuilder: (context, index, realIndex) {
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>AppDetailScreen( path: imageAds[index],),));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          imageAds[index],
                        ),
                        fit: BoxFit.fill),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(0, 1),
                        blurRadius: 10,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            },
            options: CarouselOptions(
                autoPlay: true,
                autoPlayAnimationDuration: Duration(seconds: 2),
                height: 150),
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

          Text(
            "Sale Forecasting",
            style: Theme.of(context).textTheme.titleLarge,
          ),

          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            height: 200, // Add a specific height
            child: FutureSaleForecastingOverview(),
          ),
          Center(
            child: TextButton(
              onPressed: (){

              },
              child: Text("Look Detail",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      )),
            ),
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
