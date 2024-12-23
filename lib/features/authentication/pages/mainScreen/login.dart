import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/widgets/data_import_button.dart';
import 'package:innovation_proeject/responsiveScreenControllerAbstract/parent_screen_controller.dart';
import 'package:lottie/lottie.dart';

import 'Bloc/cubit.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _companyNameController.dispose();
    super.dispose();
  }

  void _onLoginButtonPressed() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final companyName = _companyNameController.text;
    if (username == 'ShineWai' && password == "123") {
      final myKeyToProvider = context.read<DataImportCubit>();
      myKeyToProvider.updateCompanyName(companyName);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              ScreenFactory.getPlatformScreen(Theme.of(context).platform)
                  .build(context),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Your Password Wasn't Correct"),
        ),
      );
    }
    print('Username: $username');
    print('Password: $password');
    print('Company Name: $companyName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 300,
                      child: Lottie.asset("onBoardingScreen/login.json")),
                  SizedBox(height: 10),
                  Text(
                    "Please login to your account",
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                ],
              ),
              SizedBox(height: 40),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: Colors.white,
                  labelText: 'Username',
                  labelStyle: Theme.of(context).textTheme.titleMedium,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue),
                      borderRadius: BorderRadius.circular(12)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  prefixIconColor: Colors.white,
                  labelText: 'Password',
                  labelStyle: Theme.of(context).textTheme.titleMedium,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue),
                      borderRadius: BorderRadius.circular(12)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _companyNameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.business),
                  prefixIconColor: Colors.white,
                  labelText: 'Company Name',
                  labelStyle: Theme.of(context).textTheme.titleMedium,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue),
                      borderRadius: BorderRadius.circular(12)),
                  focusColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120.0),
                child: GestureDetector(
                  onTap: _onLoginButtonPressed,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.shade200,
                          offset: Offset(0, 4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Text('Login',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.black)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
