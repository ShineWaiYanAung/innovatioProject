import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        
        SizedBox(height: 30,),
        SizedBox(
          child: Lottie.asset("onBoardingScreen/page2.json"),
        ), SizedBox(height: 20,),
        Center(child: Text("Track the Trend Market...",style: Theme.of(context).textTheme.titleMedium,))
      ],
    );
  }
}
