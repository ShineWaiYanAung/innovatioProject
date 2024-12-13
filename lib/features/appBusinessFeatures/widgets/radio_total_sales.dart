import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Functions/Cubit/cubit_data_state_mangaement.dart';
import '../Functions/TotalSalesChoiceFunction/Factory/total_sale_factory.dart';

class RadioTotalSales extends StatefulWidget {
  const RadioTotalSales({super.key});

  @override
  State<RadioTotalSales> createState() => _RadioTotalSalesState();
}

class _RadioTotalSalesState extends State<RadioTotalSales> {
  // Move this variable outside of the build method to make it stateful
  String currentOptions = 'Annual';  // Default option is 'Annual'

  @override
  Widget build(BuildContext context) {
    List<String> options = ['Annual', 'Monthly', 'Daily'];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Color(0xff292A2B), borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          buildRadio(0, options, "Annual", context),
          buildRadio(1, options, "Monthly", context),
          buildRadio(2, options, "Daily", context),
        ],
      ),
    );
  }

  Row buildRadio(
      int optionsValue,
      List<String> options,
      String currentOptionsName,
      BuildContext context,
      ) {
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
                  print(currentOptions);    // Print the selected option
                });
              },
            ),
            Text(currentOptionsName,
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        Text("MMK1 lakhs", style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}
