import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

     
        SizedBox(height: 30,),
        SizedBox(
          child: Lottie.asset("onBoardingScreen/page3.json"),
        ), SizedBox(height: 20,),
        Center(child: Text("Be the Unicorn...",style: Theme.of(context).textTheme.titleMedium,))
      ],
    );
  }
}
