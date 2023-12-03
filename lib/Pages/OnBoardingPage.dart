import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:socdoc_flutter/Utils/Color.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final pageController = PageController();
  final selectedIndex = ValueNotifier(0);

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
    "accurate and detailed insights from users",
    "nearby pharmacies at a glance",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: animations.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _LogoPage();
                } else {
                  return _PageLayout(
                    animation: animations[index - 1],
                    title: description_title[index - 1],
                    info: description_info[index - 1],
                  );
                }
              },
              onPageChanged: (value) {
                selectedIndex.value = value;
              },
            ),
          ),
          ValueListenableBuilder(
            valueListenable: selectedIndex,
            builder: (context, index, child) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Wrap(
                      spacing: 8,
                      children: List.generate(animations.length + 1, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 8,
                          width: selectedIndex.value == index ? 24 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: selectedIndex.value == index
                                ? AppColor.SocdocBlue
                                : AppColor.SocdocBlue.withOpacity(0.5),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PageLayout extends StatelessWidget {
  const _PageLayout({
    required this.animation,
    required this.title,
    required this.info,
  });

  final String animation;
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width,
            child: Lottie.asset(
              animation,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            title,
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            info,
            style: const TextStyle(
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

class _LogoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.7,
            width: MediaQuery.of(context).size.width,
            child: const Image(
              image: AssetImage('assets/socdoc_title_logo.png'),
            ),
          ),
        ],
      ),
    );
  }
}
