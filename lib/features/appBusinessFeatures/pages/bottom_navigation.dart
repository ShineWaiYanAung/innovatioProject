import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/pages/dash_board.dart';


class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int index = 0;
  List<Icon> iconsButton =[
    Icon(Icons.dashboard,color: Colors.black,size: 20,),

    Icon(Icons.shop_two_rounded,color: Colors.black,size: 20,),

    Icon(Icons.person,color: Colors.black,size: 20,),

    Icon(Icons.analytics_outlined,color: Colors.black,size: 20,),

  ];
  List<Widget> pages =[
    DashBoardScreen(),
    Container(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, color: Colors.white),
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.white,))
          ],
        ),
      body: pages[index],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
          items: iconsButton,
      onTap: (index){
          setState(() {

            this.index = index;
          });
      },)
    );
  }
}
