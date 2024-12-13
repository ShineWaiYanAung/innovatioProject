import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Text("Login",style: TextStyle(color: Theme.of(context).textTheme.titleLarge!.color, fontFamily: "InriaSerif",),)
        ],
      ),
    );
  }
}
