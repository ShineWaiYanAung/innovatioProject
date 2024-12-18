import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Header Container
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(child: Text("S"),),
              accountName: Text("ShineWaiYanAung"), accountEmail: Text("accountGamil.com")),
         
          // SizedBox(height: 40),
          //
          // // Card for Profile
          // Card(
          //   color: Theme.of(context).primaryColor,
          //   margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          //   child: ListTile(
          //     leading: Icon(Icons.person, color: Colors.white),
          //     title: Text('Profile', style: TextStyle(color: Colors.white)),
          //     onTap: () {
          //       Navigator.of(context).push(
          //         MaterialPageRoute(
          //           builder: (context) => ProfileScreen(
          //             userAccount: accountModel,
          //             isShowUpBar: true,
          //           ),
          //         ),
          //       );
          //       // Navigate to profile screen
          //     },
          //   ),
          // ),
          // SizedBox(height: 20),
          // // Card for About App
          // Card(
          //   color: Theme.of(context).primaryColor,
          //   margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          //   child: ListTile(
          //     leading: Icon(Icons.info, color: Colors.white),
          //     title: Text('About App', style: TextStyle(color: Colors.white)),
          //     onTap: () {
          //       Navigator.of(context).push(
          //         MaterialPageRoute(
          //           builder: (context) => AboutApp(),
          //         ),
          //       );
          //     },
          //   ),
          // ),
          // SizedBox(height: 20),
          //
          // // Card for Grading
          // Card(
          //   color: Theme.of(context).primaryColor,
          //   margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          //   child: ListTile(
          //     leading: Icon(Icons.grade, color: Colors.white),
          //     title: Text('Grading', style: TextStyle(color: Colors.white)),
          //     onTap: () {
          //
          //     },
          //   ),
          // ),
          //
          // Spacer(), // Push the logout button to the bottom
          //
          // // Logout Button
          // ListTile(
          //   leading: Icon(Icons.logout, color: Colors.red),
          //   title: Text('Logout', style: TextStyle(color: Colors.red)),
          //   onTap: () {
          //     // Handle logout functionality
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) => Login(),
          //       ),
          //     );
          //     // Implement logout logic here
          //   },
          // ),
        ],
      ),
    );

  }
}
