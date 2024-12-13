import 'package:flutter/material.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/widgets/stock_chart.dart';

import '../widgets/bar_chart.dart';
import '../widgets/data_import_button.dart';
import '../widgets/line_chart.dar.dart';
import '../widgets/radio_top_product_sale.dart';
import '../widgets/radio_total_sales.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text("Welcome, CEO", style: Theme.of(context).textTheme.titleLarge),
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
                DataImportButton(
                  name: 'Import',
                  textColor: Colors.black,
                  gradient: [Colors.white, Colors.white],
                  icon: Icon((Icons.download)),
                ),
                DataImportButton(
                  name: 'Conntect',
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
            Text("Total Sales", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(
              height: 20,
            ),

            ///Radio Button My Clicker
            RadioTotalSales(),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 300, // Set an appropriate height
              child: BarChartSample(),
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

            ///Top Sale Data
            Text("Most Popular Product",
                style: Theme.of(context).textTheme.titleLarge),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200, // Set an appropriate height
              child: LineChartSample(),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Center(
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Daily Most Popular is Black Shirt",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: Colors.white),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),

            RadioTopProductSale(),
            SizedBox(height: 20,),
            Divider(
              color: Colors.grey,
              thickness: 3,
            ),
            SizedBox(
              height: 10,
            ),
            Text("Sale Alert", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(
              height: 200, // Set an appropriate height
              child:  StockBarChart()
            ),



          ],

      ),
    );
  }
}
