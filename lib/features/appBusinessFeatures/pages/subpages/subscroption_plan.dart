import 'package:flutter/material.dart';

class SubscriptionPlan extends StatefulWidget {
  const SubscriptionPlan({super.key});

  @override
  State<SubscriptionPlan> createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {
  String? selectedTier = 'Basic';
  String? currentOptions = 'Month';
  List<String> options = ['One Year', 'Monthly'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Unlocked Features",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ///BuildPlanButton
              buildPlanButton(context, "Subscription Plan", () {}),
              buildPlanButton(context, "Pay-Per-Use ", () {}),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.info,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                ///DropDownBuuton
                Container(
                  width: 200,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.transparent, // Transparent parent
                    border: Border.all(
                        color: Colors.grey, width: 0.8), // Optional border
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DropdownButton<String>(
                    underline: SizedBox(),
                    dropdownColor: Colors.white, // White dropdown background
                    value: selectedTier,
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(20),
                    items: [
                      DropdownMenuItem<String>(
                        value: 'Basic',
                        alignment: Alignment.center,
                        child: Text('Basic',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.black),),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Premier',
                        alignment: Alignment.center,
                        child: Text('Premier',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.black),),
                      ),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedTier = newValue;
                      });
                    },
                    style: const TextStyle(
                      color: Colors.black, // Text color
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  buildRadio(0, options, "Monthly", context),
                  buildRadio(1, options, "Yearly", context),
                ],)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPlanButton(
      BuildContext context, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 130,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(fontWeight: FontWeight.bold,color: Colors.black),
        ),
      ),
    );
  }

  Widget buildRadio(
    int optionsValue,
    List<String> options,
    String currentOptionsName,
    BuildContext context,
  ) {
    return Row(
      children: [
        Radio<String>(
          activeColor: Colors.blue,
          value: options[optionsValue],
          groupValue: currentOptions,
          onChanged: (value) {
            if (value == 'One Year') {
            } else if (value == 'Monthly') {}
            setState(() {
              currentOptions = value!; // Set the selected option
              print(currentOptions); // Print the selected option
            });
          },
        ),
        Text(currentOptionsName,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
