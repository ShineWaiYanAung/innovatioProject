import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/widgets/pdft.viewer.dart';

import '../Functions/Cubit/cubit_data_state_mangaement.dart';
import '../Functions/TotalSalesChoiceFunction/Factory/total_sale_factory.dart';

class RadioTotalSales extends StatefulWidget {
  const RadioTotalSales({super.key});

  @override
  State<RadioTotalSales> createState() => _RadioTotalSalesState();
}

class _RadioTotalSalesState extends State<RadioTotalSales> {
  // Move this variable outside of the build method to make it stateful
  String currentOptions = 'Annual'; // Default option is 'Annual'

  @override
  Widget build(BuildContext context) {
    List<String> options = ['Annual', 'Monthly', 'Daily'];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Color(0xff292A2B), borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Text(
            "Profits",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          buildRadio(0, options, "Annual", context, "60"),
          buildRadio(1, options, "Monthly", context, "10"),
          buildRadio(2, options, "Daily", context, "30"),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PDFViewerScreen(
                      title: "Total Sale Report",
                      filePath: "asset/fabReport/customer_review.pdf"),
                ),
              );
            },
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Row buildRadio(int optionsValue, List<String> options,
      String currentOptionsName, BuildContext context, String profit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Radio<String>(
              activeColor: Colors.blue,
              value: options[optionsValue],
              groupValue: currentOptions,
              onChanged: (value) {
                if (value == 'Annual') {
                  context.read<SalesCubit>().updateSaleType(SaleType.annually);
                } else if (value == 'Monthly') {
                  context.read<SalesCubit>().updateSaleType(SaleType.monthly);
                } else if (value == 'Daily') {
                  context.read<SalesCubit>().updateSaleType(SaleType.daily);
                }
                setState(() {
                  currentOptions = value!; // Set the selected option
                  print(currentOptions); // Print the selected option
                });
              },
            ),
            Text(currentOptionsName,
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        Text(
          "$profit %",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.green),
        ),
      ],
    );
  }
}
