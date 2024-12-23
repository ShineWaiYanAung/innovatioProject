import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataFetchScreen extends StatefulWidget {
  @override
  _DataFetchScreenState createState() => _DataFetchScreenState();
}

class _DataFetchScreenState extends State<DataFetchScreen> {
  bool isDataFetched = false;
  String errorMessage = '';
  String apiData = ''; // Variable to store API data as a string

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // Function to fetch data from the API
  Future<void> fetchData() async {
    final url = Uri.parse('https://1039-45-41-104-242.ngrok-free.app/read/?company_name=FAB');
    try {
      // Make the HTTP GET request
      final response = await http.get(url, headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "ngrok-skip-browser-warning": "true",
        "User-Agent": "CustomUserAgent"
      });

      // Check if the response status is OK
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Verify the structure of the received data
        if (data is Map<String, dynamic> && data['data'] != null) {
          setState(() {
            isDataFetched = true;
            errorMessage = '';
            apiData = jsonEncode(data['data']); // Store formatted JSON string
          });
        } else {
          throw Exception("Unexpected data format received.");
        }
      } else {
        throw Exception("Failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      // Handle errors gracefully
      setState(() {
        isDataFetched = false;
        errorMessage = "Error: $e";
        apiData = ''; // Clear previous data
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Data Fetch Example')),
      body: Center(
        child: isDataFetched
            ? SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Text(
            apiData,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        )
            : errorMessage.isNotEmpty
            ? Text(
          errorMessage,
          style: TextStyle(fontSize: 18, color: Colors.red),
          textAlign: TextAlign.center,
        )
            : Text(
          'Failed to fetch data',
          style: TextStyle(fontSize: 18, color: Colors.red),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchData,
        child: Icon(isDataFetched ? Icons.check : Icons.error),
        backgroundColor: isDataFetched ? Colors.green : Colors.red,
      ),
    );
  }
}
