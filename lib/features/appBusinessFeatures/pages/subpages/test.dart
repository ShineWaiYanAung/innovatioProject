import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataPostScreen extends StatefulWidget {
  @override
  _DataPostScreenState createState() => _DataPostScreenState();
}

class _DataPostScreenState extends State<DataPostScreen> {
  bool isLoading = false;
  String errorMessage = '';
  String responseData = '';

  // Function to post data
  Future<void> postRecord() async {
    final bodyData = {
      "yearly": "2024",
      "monthly": [
        {"order_date": "January", "sales": 5000000.0, "month_abbreviation": "Jan"},
        {"order_date": "February", "sales": 5500000.0, "month_abbreviation": "Feb"},
        {"order_date": "March", "sales": 6000000.0, "month_abbreviation": "Mar"},
        {"order_date": "April", "sales": 6500000.0, "month_abbreviation": "Apr"},
        {"order_date": "May", "sales": 7000000.0, "month_abbreviation": "May"},
        {"order_date": "June", "sales": 7500000.0, "month_abbreviation": "Jun"},
        {"order_date": "July", "sales": 8000000.0, "month_abbreviation": "Jul"},
        {"order_date": "August", "sales": 8500000.0, "month_abbreviation": "Aug"},
        {"order_date": "September", "sales": 9000000.0, "month_abbreviation": "Sep"},
        {"order_date": "October", "sales": 9500000.0, "month_abbreviation": "Oct"},
        {"order_date": "November", "sales": 10000000.0, "month_abbreviation": "Nov"},
        {"order_date": "December", "sales": 11000000.0, "month_abbreviation": "Dec"}
      ],
      "daily_sales": [
        {"date": "01/1/2024", "sale": 150000.0},
        {"date": "02/1/2024", "sale": 160000.0},
        {"date": "03/1/2024", "sale": 170000.0},
        {"date": "04/1/2024", "sale": 180000.0},
        {"date": "05/1/2024", "sale": 190000.0},
        {"date": "06/1/2024", "sale": 200000.0},
        {"date": "07/1/2024", "sale": 210000.0},
        {"date": "08/1/2024", "sale": 220000.0},
        {"date": "09/1/2024", "sale": 230000.0},
        {"date": "10/1/2024", "sale": 240000.0},
        {"date": "11/1/2024", "sale": 250000.0},
        {"date": "12/1/2024", "sale": 260000.0},
        {"date": "13/1/2024", "sale": 270000.0},
        {"date": "14/1/2024", "sale": 280000.0},
        {"date": "15/1/2024", "sale": 290000.0},
        {"date": "16/1/2024", "sale": 300000.0},
        {"date": "17/1/2024", "sale": 310000.0},
        {"date": "18/1/2024", "sale": 320000.0},
        {"date": "19/1/2024", "sale": 330000.0},
        {"date": "20/1/2024", "sale": 340000.0},
        {"date": "21/1/2024", "sale": 350000.0},
        {"date": "22/1/2024", "sale": 360000.0},
        {"date": "23/1/2024", "sale": 370000.0},
        {"date": "24/1/2024", "sale": 380000.0},
        {"date": "25/1/2024", "sale": 390000.0},
        {"date": "26/1/2024", "sale": 400000.0},
        {"date": "27/1/2024", "sale": 410000.0},
        {"date": "28/1/2024", "sale": 420000.0},
        {"date": "29/1/2024", "sale": 430000.0},
        {"date": "30/1/2024", "sale": 440000.0},
        {"date": "31/1/2024", "sale": 450000.0}
      ]
    };

    setState(() {
      isLoading = true; // Show loading indicator
    });

    try {
      final response = await http.post(
        Uri.parse("https://686b-45-41-104-185.ngrok-free.app/create/?company_name=ShineGOD"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "ngrok-skip-browser-warning": "true",
          "User-Agent": "CustomUserAgent",
        },
        body: jsonEncode(bodyData),
      );

      if (response.statusCode == 200) {
        setState(() {
          errorMessage = 'Data posted successfully!';
        });
      } else {
        throw Exception("Failed to post data: ${response.statusCode}");
      }
    } catch (err) {
      setState(() {
        errorMessage = err.toString(); // Show error message
      });
    } finally {
      setState(() {
        isLoading = false; // Hide loading indicator
      });
    }
  }

  // Function to read the posted data (or other data)
  Future<void> readData() async {
    setState(() {
      isLoading = true; // Show loading indicator while fetching data
    });

    try {
      final response = await http.get(
        Uri.parse("https://686b-45-41-104-185.ngrok-free.app/read/?company_name=ShineGOD"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "ngrok-skip-browser-warning": "true",
     "User-Agent": "CustomUserAgent"
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          responseData = jsonEncode(data); // Store and display the read data
        });
      } else {
        throw Exception("Failed to read data: ${response.statusCode}");
      }
    } catch (err) {
      setState(() {
        errorMessage = err.toString(); // Show error message
      });
    } finally {
      setState(() {
        isLoading = false; // Hide loading indicator
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post & Read Data")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            isLoading
                ? CircularProgressIndicator() // Show loading indicator
                : Column(
              children: [
                ElevatedButton(
                  onPressed: postRecord, // Call postRecord when button is pressed
                  child: Text('Send Data'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: readData, // Call readData when button is pressed
                  child: Text('Read Data'),
                ),
                SizedBox(height: 20),
                if (errorMessage.isNotEmpty)
                  Text(
                    errorMessage,
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                if (responseData.isNotEmpty)
                  SingleChildScrollView(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      responseData,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Future<void> fetchData() async {
//   final url = Uri.parse('https://686b-45-41-104-185.ngrok-free.app/read/?company_name=FAB');
//   try {
//     final response = await http.get(url, headers: {
//       "Content-Type": "application/json",
//       "Accept": "application/json",
//       "ngrok-skip-browser-warning": "true",
//       "User-Agent": "CustomUserAgent"
//     });
//
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       if (data is Map<String, dynamic> && data['data'] != null) {
//         setState(() {
//           isDataFetched = true;
//           errorMessage = '';
//           apiData = jsonEncode(data['data']); // Store formatted JSON string
//         });
//       } else {
//         throw Exception("Unexpected data format received.");
//       }
//     } else {
//       throw Exception("Failed with status code: ${response.statusCode}");
//     }
//   } catch (e) {
//     setState(() {
//       isDataFetched = false;
//       errorMessage = "Error: $e";
//       apiData = ''; // Clear previous data
//     });
//   }
// }
