import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Center(child: Text("Welcome From FAB",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24),)),
        SizedBox(height: 20,),
        SizedBox(
          child: Lottie.asset("onBoardingScreen/page1.json"),
        ), SizedBox(height: 20,),
        Center(child: Text("Upgrade Your Business Growth...",style: Theme.of(context).textTheme.titleMedium,))
      ],
    );
  }
}
