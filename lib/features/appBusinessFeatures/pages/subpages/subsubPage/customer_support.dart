import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomerSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        centerTitle: true,
        title: Text("Customer Support",style: Theme.of(context).textTheme.titleLarge,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Lottie animation for the loading or welcome screen
            Lottie.asset(
              'onBoardingScreen/customer_sup.json',  // Replace with your Lottie file path
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 20),  // Add space between animation and text

            // Text section simulating the customer support page with white text
            Text(
              'How can we assist you today?',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Our customer support team is here to help with any questions or issues you may have. Please feel free to reach out to us by following the instructions below.',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement action for the button (e.g., opening a support form or chat)
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Support button clicked")));
              },
              child: Text('Contact Support', style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.black, fontSize: 16),),
            ),
          ],
        ),
      ),
    );
  }
}
