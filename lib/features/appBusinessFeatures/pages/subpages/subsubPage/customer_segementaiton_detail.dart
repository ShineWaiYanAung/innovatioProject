import 'package:flutter/material.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/widgets/Customer_segementaiton_button.dart';

class CustomerSegmentaitonDetail extends StatefulWidget {
  const CustomerSegmentaitonDetail({super.key});

  @override
  State<CustomerSegmentaitonDetail> createState() =>
      _CustomerSegmentaitonDetailState();
}

class _CustomerSegmentaitonDetailState
    extends State<CustomerSegmentaitonDetail> {
  // List of years for the dropdown
  List<String> years = ['All', '2018', '2019', '2020', '2021', '2022', '2023'];
  String selectedYear = 'All'; // Default selected option is 'All'

  // Sample data
  final List<YearMonthData> allData = [
    YearMonthData(
        yearMonth: '2018-10', totalOrders: 61, totalSpending: 48754.75),
    YearMonthData(
        yearMonth: '2018-11', totalOrders: 67, totalSpending: 68175.79),
    YearMonthData(
        yearMonth: '2018-12', totalOrders: 49, totalSpending: 19671.81),
    YearMonthData(
        yearMonth: '2019-01', totalOrders: 9964, totalSpending: 1876208.65),
    YearMonthData(
        yearMonth: '2019-02', totalOrders: 12297, totalSpending: 2282354.17),
    YearMonthData(
        yearMonth: '2019-03', totalOrders: 15562, totalSpending: 2894380.3),
    YearMonthData(
        yearMonth: '2019-04', totalOrders: 18825, totalSpending: 3515414.29),
    YearMonthData(
        yearMonth: '2019-05', totalOrders: 17017, totalSpending: 3257770.48),
  ];

  // Filtered data based on the selected year
  List<YearMonthData> get filteredData {
    if (selectedYear == 'All') {
      return allData; // Return all data when 'All' is selected
    } else {
      return allData
          .where((item) => item.yearMonth.startsWith(selectedYear))
          .toList(); // Filter data based on the selected year
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: [
          // Icon button with white icon color for dropdown menu
          IconButton(
            onPressed: () {
              // Show dropdown when the button is pressed
              showMenu(
                color: Colors.white,
                context: context,
                position: RelativeRect.fromLTRB(
                    300.0, 80.0, 10.0, 0.0), // Position of the dropdown
                items: [
                  PopupMenuItem(
                    // Customizing the PopupMenuItem background and text style
                    textStyle: TextStyle(color: Colors.white),
                    value: 'filter',
                    child: DropdownButton<String>(
                      dropdownColor:
                          Colors.white, // Set the dropdown background to black
                      value: selectedYear,
                      items: years.map((String year) {
                        return DropdownMenuItem<String>(
                          value: year,
                          child: Text(
                            year,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: Colors
                                        .black), // Set the text color to white
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedYear = newValue!;
                        });
                        Navigator.of(context)
                            .pop(); // Close the dropdown after selection
                      },
                    ),
                  ),
                ],
              );
            },
            icon: Icon(Icons.tune,
                color: Colors.white), // White icon for the button
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            SizedBox(height: 20),
            Text(
              "Customers Details",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 30,
            ),
            CustomerSegementaitonButton(),
            SizedBox(height: 40),
            MyTable(filteredData: filteredData), // Pass filtered data
          ],
        ),
      ),
    );
  }
}

class MyTable extends StatelessWidget {
  final List<YearMonthData> filteredData;

  const MyTable({Key? key, required this.filteredData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Set the background color of the container
      child: Table(
        textDirection: TextDirection.ltr, // Left-to-right text direction
        border: TableBorder.all(color: Colors.grey), // Set the border color
        children: [
          // Header Row
          TableRow(
            decoration: BoxDecoration(color: Colors.white), // Header background
            children: [
              _buildHeaderCell('Year-Month'),
              _buildHeaderCell('Total Orders'),
              _buildHeaderCell('Total Spending'),
            ],
          ),
          // Dynamic Data Rows
          for (var item in filteredData)
            TableRow(
              decoration:
                  BoxDecoration(color: Colors.grey[850]), // Row background
              children: [
                _buildDataCell(item.yearMonth),
                _buildDataCell(item.totalOrders.toString()),
                _buildDataCell('\$${item.totalSpending.toStringAsFixed(2)}'),
              ],
            ),
        ],
      ),
    );
  }

  // Helper function to build header cell
  TableCell _buildHeaderCell(String text) {
    return TableCell(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
    );
  }

  // Helper function to build data cell
  TableCell _buildDataCell(String text) {
    return TableCell(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class YearMonthData {
  final String yearMonth;
  final int totalOrders;
  final double totalSpending;

  YearMonthData({
    required this.yearMonth,
    required this.totalOrders,
    required this.totalSpending,
  });
}
