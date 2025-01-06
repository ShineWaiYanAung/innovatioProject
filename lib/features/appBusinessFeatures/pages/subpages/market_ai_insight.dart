import 'package:flutter/material.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/pages/subpages/subsubPage/product_detail.dart';

import '../../widgets/bar_chart.dart';
import '../../widgets/data_import_button.dart';
import '../../widgets/line_chart.dar.dart';
import '../../widgets/radio_top_product_sale.dart';
import '../../widgets/radio_total_sales.dart';
import '../../widgets/stock_chart.dart';

class MarketAiInsight extends StatefulWidget {
  const MarketAiInsight({super.key});

  @override
  State<MarketAiInsight> createState() => _MarketAiInsightState();
}

class _MarketAiInsightState extends State<MarketAiInsight> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
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
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetail(),));
                    },
                    child: Text(
                      "Daily Most Popular is Black Shirt",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: Colors.white,fontSize:13),
                    ))),
          ),
          SizedBox(
            height: 10,
          ),

          // RadioTopProductSale(),
          // SizedBox(height: 20,),
          Divider(
            color: Colors.grey,
            thickness: 3,
          ),
          SizedBox(
            height: 10,
          ),
          // Text("Sale Alert", style: Theme.of(context).textTheme.titleLarge),
          // SizedBox(
          //     height: 200, // Set an appropriate height
          //     child:  StockBarChart()
          // ),



        ],

      ),
    );
  }
}
