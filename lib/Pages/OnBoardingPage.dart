import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  final animations = [
    "assets/lottie/animation_1.json",
    "assets/lottie/animation_2.json",
    "assets/lottie/animation_3.json",
  ];

  final description_title = [
    "Find",
    "Reviews",
    "Exploring",
  ];

  final description_info = [
    "hospitals near me by distinct",
    "from real users",
    "surrounding pharmacies",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) {
                  return _PageLayout(
                    animation: animations[index],
                    title: description_title[index],
                    info: description_info[index],
                  );
                },
              ),
            ),
          ],
        )
    );
  }
}

class _PageLayout extends StatelessWidget{
  const _PageLayout({
    required this.animation,
    required this.title,
    required this.info,
  });

  final String animation;
  final String title;
  final String info;

  @override
  Widget build(BuildContext context){
    return Padding(padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.7,
              width: MediaQuery.of(context).size.width,
              child: Lottie.asset(
                animation,
              ),
            ),
            Text(title, style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(info, style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ],
        )
    );
  }
}
