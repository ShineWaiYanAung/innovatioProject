import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/pages/subpages/subsubPage/customer_segementaiton_detail.dart';

class CustomerSegmentation extends StatefulWidget {
  const CustomerSegmentation({super.key});

  @override
  State<CustomerSegmentation> createState() => _CustomerSegmentationState();
}

class _CustomerSegmentationState extends State<CustomerSegmentation> {
  // Initially set the values for the three types of buyers
  double seasonalBuyer = 30;
  double occasionalBuyer = 40;
  double loyalBuyer = 30;

  double kPayPercentage = 30;

  double WavePercentage = 10;
  double CbPercentage = 20;
  double cashPercentge = 30;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Text("Customer Segmentation",
              style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 10),
          Row(
            children: [
              // Wrap PieChart with Flexible widget to allow it to take only available space
              Flexible(
                child: SizedBox(
                  height: 250, // Define a fixed height for the pie chart
                  child: PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          value: seasonalBuyer,
                          title: '${seasonalBuyer.toInt()}%',
                          color: Colors.blue,
                          radius: 50,
                          titleStyle:
                              TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        PieChartSectionData(
                          value: occasionalBuyer,
                          title: '${occasionalBuyer.toInt()}%',
                          color: Colors.green,
                          radius: 50,
                          titleStyle:
                              TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        PieChartSectionData(
                          value: loyalBuyer,
                          title: '${loyalBuyer.toInt()}%',
                          color: Colors.orange,
                          radius: 50,
                          titleStyle:
                              TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                      borderData: FlBorderData(show: false),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                    ),
                  ),
                ),
              ),

              // Add some space between pie chart and legend
              SizedBox(width: 20),

              // Legend Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Legend for Seasonal Buyer
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Seasonal Buyer',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Legend for Occasional Buyer
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        color: Colors.green,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Occasional Buyer',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Legend for Loyal Buyer
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        color: Colors.orange,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Loyal Buyer',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              const CustomerSegmentaitonDetail(),
                        ),
                      );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Look Detail",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: 3,
          ),
          Text("Payment Segmentation",
              style: Theme.of(context).textTheme.titleLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Wrap PieChart with Flexible widget to allow it to take only available space
              Flexible(
                child: SizedBox(
                  height: 250, // Define a fixed height for the pie chart
                  child: PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          value: kPayPercentage,
                          title: '${kPayPercentage.toInt()}%',
                          color: Colors.blue,
                          radius: 50,
                          titleStyle:
                              TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        PieChartSectionData(
                          value: cashPercentge,
                          title: '${cashPercentge.toInt()}%',
                          color: Colors.white,
                          radius: 50,
                          titleStyle:
                              TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        PieChartSectionData(
                          value: CbPercentage,
                          title: '${CbPercentage.toInt()}%',
                          color: Colors.green,
                          radius: 50,
                          titleStyle:
                              TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        PieChartSectionData(
                          value: WavePercentage,
                          title: '${WavePercentage.toInt()}%',
                          color: Colors.orange,
                          radius: 50,
                          titleStyle:
                              TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                      borderData: FlBorderData(show: false),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                    ),
                  ),
                ),
              ),

              // Add some space between pie chart and legend
              SizedBox(width: 20),

              // Legend Section
              SizedBox(
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildPayMentLegend(context, 'Kpay', Colors.blue),
                    SizedBox(height: 8),
                    // Legend for Occasional Buyer
                    buildPayMentLegend(context, 'CBPay', Colors.green),
                    SizedBox(height: 8),
                    // Legend for Loyal Buyer
                    buildPayMentLegend(context, 'Wave', Colors.orange),
                    SizedBox(height: 8),

                    buildPayMentLegend(context, 'Cash', Colors.white),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const CustomerSegmentaitonDetail(),
                          ),
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Look Detail",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row buildPayMentLegend(BuildContext context, String title, Color color) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          color: color,
        ),
        SizedBox(width: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
