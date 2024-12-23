import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  bool colorModeChange = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Header Container
          SizedBox(
            height: 250,
            child: UserAccountsDrawerHeader(
              otherAccountsPictures: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      colorModeChange = !colorModeChange;
                      print(colorModeChange);
                    });
                  },
                  icon: colorModeChange
                      ? Icon(
                          Icons.nightlight_sharp,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.sunny,
                          color: Colors.orangeAccent,
                        ),
                ),
              ],
              otherAccountsPicturesSize: Size.square(40),
              currentAccountPictureSize: Size.square(100),
              decoration: BoxDecoration(color: Colors.black),
              currentAccountPicture: CircleAvatar(child: Text("S")),
              accountName: Text(
                "ShineWaiYanAung",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              accountEmail: Text(
                "accountGmail.com",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),

          SizedBox(height: 40),

          // Card for Profile
          Card(
            color: Theme.of(context).scaffoldBackgroundColor,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: Text(
                'Profile',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () {},
            ),
          ),
          SizedBox(height: 20),
          // Card for About App
          Card(
            color: Theme.of(context).scaffoldBackgroundColor,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: ListTile(
                leading: Icon(Icons.info, color: Colors.white),
                title: Text(
                  'About App',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                onTap: () {}),
          ),
          SizedBox(height: 20),

          // Card for Grading
          Card(
            color: Theme.of(context).scaffoldBackgroundColor,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: ListTile(
              leading: Icon(Icons.support_agent, color: Colors.white),
              title: Text(
                'Support',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () {},
            ),
          ),

          Spacer(), // Push the logout button to the bottom

          // Logout Button
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () {
              // Handle logout functionality

              // Implement logout logic here
            },
          ),
        ],
      ),
    );
  }
}
