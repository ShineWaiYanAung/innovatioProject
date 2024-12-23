import 'package:flutter/material.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/pages/OnBoardingPage/intro_page1.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/pages/Questionire/questionirepage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'intro_page2.dart';
import 'intro_page3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      PageView(
        onPageChanged: (index) {
          setState(() {
            onLastPage = (index == 2);
          });
        },
        controller: _controller,
        children: const [
          IntroPage1(),
          IntroPage2(),
          IntroPage3(),
        ],
      ),
      Container(
        alignment: Alignment(0, 0.75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                _controller.jumpToPage(2);
              },
              child: Text(
                "Skip",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SmoothPageIndicator(
                effect: ScrollingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Colors.white,
                ),
                controller: _controller,
                count: 3),
            onLastPage
                ? TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => QuestionnairePage(),
                        ),
                      );
                    },
                    child: Text(
                      "Enter",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  )
                : TextButton(
                    onPressed: () {
                      _controller.nextPage(
                          duration: Duration(microseconds: 1000),
                          curve: Curves.easeIn);
                    },
                    child: Text(
                      "Next",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
          ],
        ),
      )
    ]));
  }
}
