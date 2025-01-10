import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/pages/subpages/subsubPage/ads_video_page.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/widgets/data_import_button.dart';
import 'package:innovation_proeject/responsiveScreenControllerAbstract/parent_screen_controller.dart';
import 'package:lottie/lottie.dart';

import '../../../appBusinessFeatures/pages/subpages/subsubPage/before_data_import.dart';
import 'Bloc/cubit.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  String _selectedIndustry = "Choose Business Type";

  final List<String> _businessTypes = [
    'Convenience Store',
    'Clothing or Fashion Shop',
    'Cafeteria',
    'Restaurant',
  ];

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

    if (username == 'ShineWai' && password == "123" && _selectedIndustry !="Choose Business Type" && _companyNameController.text.isNotEmpty) {
      final myKeyToProvider = context.read<DataImportCubit>();
      myKeyToProvider.updateCompanyName(companyName);

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DataImportPage(),
        ),
      );
    }


    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Your Password Wasn't Correct Or You missed Something to supply")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 300,
                          child: Lottie.asset("onBoardingScreen/login.json"),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Please login to your account",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    _buildTextField(
                      controller: _usernameController,
                      label: 'Username',
                      icon: Icons.person,
                    ),
                    SizedBox(height: 16),
                    _buildTextField(
                      controller: _passwordController,
                      label: 'Password',
                      icon: Icons.lock,
                      obscureText: true,
                    ),
                    SizedBox(height: 16),
                    _buildTextField(
                      controller: _companyNameController,
                      label: 'Company Name',
                      icon: Icons.business,
                    ),
                    SizedBox(height: 16),
                  Center(
                    child: PopupMenuButton<String>(
                      color: Colors.black,
                      onSelected: (value) {
                        setState(() {
                          _selectedIndustry = value;
                        });
                      },
                      itemBuilder: (BuildContext context) {
                        return _businessTypes.map((String businessType) {
                          return PopupMenuItem<String>(
                            value: businessType,
                            child: Text(
                              businessType,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: Text(
                          _selectedIndustry,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
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
                          child: Text(
                            'Login',
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        prefixIconColor: Colors.white,
        labelText: label,
        labelStyle: Theme.of(context).textTheme.titleMedium,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlue),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      style: TextStyle(color: Colors.white),
    );
  }
}


