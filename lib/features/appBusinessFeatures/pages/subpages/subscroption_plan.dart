import 'package:flutter/material.dart';

class SubscriptionPlan extends StatefulWidget {
  const SubscriptionPlan({super.key});

  @override
  State<SubscriptionPlan> createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {
  String? selectedTier = 'Basic';
  String? currentOptions = 'Monthly';

  int basicPlanDollarController = 0;
  int subscriptPlanController = 0;
  int selectedPlanController = 0;
  @override
  Widget build(BuildContext context) {
    List<String> options = ['Yearly', 'Monthly'];
    //UnlockedFeatures

    //DollarList
    List<Text> basicPlanDollar = [
      Text(
        "\$50",
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      Text(
        "\$500",
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    ];
    List<Text> premierPlanDollar = [
      Text(
        "\$150",
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      Text(
        "\$1500",
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    ];

    //PlanList
    List<Container> planList = [
      buildBasicPlan(context),
      buildPremierPlan(context),
    ];

    List<Column> unlockedFeatures = [
      buildSubscription(
          context, options, basicPlanDollar, premierPlanDollar, planList),
      buildPayPerUse(context)
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                buildPlanButton(0,context, "Subscription Plan", () {
                  setState(() {
                    selectedPlanController = 0;
                  });
                },selectedPlanController),
                buildPlanButton(1,context, "Pay-Per-Use ", () {
                  setState(() {
                    selectedPlanController =1;
                  });
                },selectedPlanController),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
                padding: EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height -
                    kToolbarHeight - // Height of the AppBar
                    20 - // SizedBox above "Unlocked Features"
                    50 - // SizedBox above the Row with buttons
                    50, // SizedBox above the Container
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: unlockedFeatures[selectedPlanController]),
          ],
        ),
      ),
    );
  }

  ///Basic Plan
  Container buildBasicPlan(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Center the entire column
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildFeatures(context, "Sale Summary , Inventory Tacking"),
            SizedBox(
              height: 20,
            ),
            buildFeatures(context, "Inventory Categorization"),
            SizedBox(
              height: 20,
            ),
            buildFeatures(context, "Top Customer Segmentation"),
          ],
        ),
      ),
    );
  }

  ///Premier Plan
  Container buildPremierPlan(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Center the entire column
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildFeatures(context, "Basic + Sales Predictions"),
            SizedBox(
              height: 20,
            ),
            buildFeatures(context, "Seasonal and Event-Based Forecasting"),
            SizedBox(
              height: 20,
            ),
            buildFeatures(context, "Actionable Stock Suggestions"),
            SizedBox(
              height: 20,
            ),
            buildFeatures(context, "Global Market Recommendations"),
            SizedBox(
              height: 20,
            ),
            buildFeatures(context, "Local Market Insights"),
            SizedBox(
              height: 20,
            ),
            buildFeatures(context, "Payment Method Analysis"),
            SizedBox(
              height: 20,
            ),
            buildFeatures(context, "Personalized Marketing Campaigns"),
          ],
        ),
      ),
    );
  }

  ///Pay Per Use
  Container buildPayPerPlan(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Center the entire column
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildFeatures(
                context, "\$10 per AI-generated business report or analysis"),
            SizedBox(
              height: 20,
            ),
            buildFeatures(context, "\$100 per integration setup"),
          ],
        ),
      ),
    );
  }

  Widget buildFeatures(BuildContext context, String features) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.star,
          size: 17,
        ),
        Text(
          features,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }

  ///Build Buttons
  Widget buildPlanButton(int id,
      BuildContext context, String title, VoidCallback onTap,int selectedId) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 130,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: id==selectedId ? Colors.blue : Colors.white,
        ),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(fontWeight: FontWeight.bold, color: id==selectedId ? Colors.white : Colors.black,),
        ),
      ),
    );
  }

  ///Build Radio Change Monthly
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
            if (value == 'Yearly') {
              setState(() {
                basicPlanDollarController = 1;
              });
            } else if (value == 'Monthly') {
              setState(() {
                basicPlanDollarController = 0;
              });
            }
            setState(() {
              currentOptions = value!; // Set the selected option
              print(currentOptions); // Print the selected option
              print(basicPlanDollarController); // Print the selected option
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

  ///Subscription Plan
  Column buildSubscription(
      BuildContext context,
      List<String> options,
      List<Text> basicPlanDollar,
      List<Text> premierPlanDollar,
      List<Container> planList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            showSubscriptionDialog(context, "Subscription Plan",
                'This plan is meant to unlock exclusive features, giving you access to premium content and advanced functionality.');
          },
          icon: Icon(
            Icons.info,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 20,
        ),

        ///DropDownButton
        Container(
          width: 200,
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.transparent, // Transparent parent
            border:
                Border.all(color: Colors.grey, width: 0.8), // Optional border
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
                child: Text(
                  'Basic',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 15, color: Colors.black),
                ),
              ),
              DropdownMenuItem<String>(
                value: 'Premier',
                alignment: Alignment.center,
                child: Text(
                  'Premier',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 15, color: Colors.black),
                ),
              ),
            ],
            onChanged: (String? newValue) {
              setState(() {
                selectedTier = newValue;
                if (newValue == "Premier") {
                  subscriptPlanController = 1;
                } else if (newValue == 'Basic') {
                  subscriptPlanController = 0;
                }
              });
            },
            style: const TextStyle(
              color: Colors.black, // Text color
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildRadio(0, options, "Yearly", context),
            buildRadio(1, options, "Monthly", context),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        selectedTier == "Basic"
            ? basicPlanDollar[basicPlanDollarController]
            : premierPlanDollar[basicPlanDollarController],
        SizedBox(
          height: 30,
        ),

        planList[subscriptPlanController],
        SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 200,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xff000000),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              "Subscribe",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  ///Pay-Per-Use
  Column buildPayPerUse(
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            showSubscriptionDialog(context, "PayPer-User Plan",
                'This Plan will cost you that only when you are used the features');
          },
          icon: Icon(
            Icons.info,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        buildPayPerPlan(context),
        SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 200,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xff000000),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              "Subscribe",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  ///Show Dia.og
  void showSubscriptionDialog(
      BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20.0), // Set circular border radius
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black),
          ),
          content: Text(
            content,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Close',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
