import 'package:flutter/material.dart';

class IncomeMoneySegementation extends StatefulWidget {
  const IncomeMoneySegementation({super.key});

  @override
  State<IncomeMoneySegementation> createState() =>
      _IncomeMoneySegementationState();
}

class _IncomeMoneySegementationState extends State<IncomeMoneySegementation> {
  @override
  Widget build(BuildContext context) {
    // Using the MyTable widget inside the IncomeMoneySegementation widget
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text("Money Segemenation Detail",style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20),),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MyTable(filteredData: data),
      ),
    );
  }
}

class MyTable extends StatelessWidget {
  final List<PaymentData> filteredData;

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
              _buildHeaderCell('Payment Method'),
              _buildHeaderCell('Total Revenue'),
              _buildHeaderCell('Unique Orders'),
              _buildHeaderCell('Products Sold'),
            ],
          ),
          // Dynamic Data Rows
          for (var item in filteredData)
            TableRow(
              decoration: BoxDecoration(color: Colors.grey[850]), // Row background
              children: [
                _buildDataCell(item.paymentMethod),
                _buildDataCell('\$${item.totalRevenue.toStringAsFixed(2)}'),
                _buildDataCell(item.uniqueOrders.toString()),
                _buildDataCell(item.productsSold.toString()),
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

class PaymentData {
  final String paymentMethod;
  final double totalRevenue;
  final int uniqueOrders;
  final int productsSold;

  PaymentData({
    required this.paymentMethod,
    required this.totalRevenue,
    required this.uniqueOrders,
    required this.productsSold,
  });
}

// Example usage:
List<PaymentData> data = [
  PaymentData(paymentMethod: 'AyaPay', totalRevenue: 156165, uniqueOrders: 5001, productsSold: 5007),
  PaymentData(paymentMethod: 'Cb Pay', totalRevenue: 156165, uniqueOrders: 5001, productsSold: 5007),
  PaymentData(paymentMethod: 'Cash', totalRevenue: 156165, uniqueOrders: 5001, productsSold: 5007),
  PaymentData(paymentMethod: 'Credit Card', totalRevenue: 156165, uniqueOrders: 5001, productsSold: 5007),
  PaymentData(paymentMethod: 'KBZ Pay', totalRevenue: 156165, uniqueOrders: 5001, productsSold: 5007),
];