import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/pages/subpages/customer_segementation.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/pages/subpages/dash_board.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/pages/subpages/market_ai_insight.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/pages/subpages/menu.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/pages/subpages/subscroption_plan.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/pages/subpages/test.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 0; // Default to the first index (Dashboard)

  // Define the icons
  List<IconData> icons = [
    Icons.dashboard,
    Icons.shop_two_rounded,
    Icons.person,
    Icons.analytics_outlined,
  ];

  // Define the initial colors and sizes of the icons
  List<Color> iconColors = [
    Colors.blue, // Set the first icon to blue initially
    Colors.black,
    Colors.black,
    Colors.black,
  ];

  List<double> iconSizes = [
    30.0, // Set the first icon size larger
    20.0,
    20.0,
    20.0,
  ];

  List<Widget> pages = [
    DashBoardScreen(),
    DataFetchScreen (),
    CustomerSegmentation(),
    MarketAiInsight(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            if (_scaffoldKey.currentState != null &&
                !_scaffoldKey.currentState!.isDrawerOpen) {
              _scaffoldKey.currentState!
                  .openDrawer(); // Open the drawer using the GlobalKey
            }
          },
          icon: Icon(Icons.menu, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SubscriptionPlan(),
                ),
              );
            },
            icon: Icon(Icons.notifications, color: Colors.white),
          ),
        ],
      ),
      body: pages[index],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        items: List.generate(icons.length, (i) {
          return AnimatedContainer(
            duration: Duration(
                milliseconds: 500), // Set duration for smooth animation
            curve: Curves.easeInOut, // Smooth animation curve
            child: Icon(
              icons[i],
              color: iconColors[i], // Set color based on the tapped state
              size: iconSizes[i], // Set size based on the tapped state
            ),
          );
        }),
        onTap: (index) {
          setState(() {
            // Reset the previous icon to default color and size
            iconColors = List.generate(4, (i) => Colors.black);
            iconSizes = List.generate(4, (i) => 20.0);

            // Update the tapped icon's color and size
            iconColors[index] = Colors.blue; // Set active color
            iconSizes[index] = 30.0; // Set active size
            this.index = index;
          });
        },
      ),
    );
  }
}