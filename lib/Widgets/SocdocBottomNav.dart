import 'package:flutter/material.dart';

import 'package:socdoc_flutter/Pages/MainPage.dart';
import 'package:socdoc_flutter/Pages/SearchPage.dart';

class SocdocBottomNav extends StatefulWidget {
  const SocdocBottomNav({super.key});

  @override
  State<StatefulWidget> createState() => SocdocBottomNavState();
}

class SocdocBottomNavState extends State<SocdocBottomNav> {
  var mainPage;
  @override
  Widget build(BuildContext context) {
    mainPage = context.findAncestorStateOfType<MainPageState>()!;
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: (){openSearch();},
            icon: const Icon(Icons.search)),
          IconButton(
            onPressed: (){updateIdx(1);},
            icon: const Image(image: AssetImage('assets/socdoc_logo.png'))),
          IconButton(
            onPressed: (){updateIdx(2);},
            icon: const Icon(Icons.person))
        ],
      ),
    );
  }

  void openSearch(){
    Navigator.push(context,
      MaterialPageRoute(
        builder: (context) => SearchPage()
      ));
  }

  void updateIdx(idx){
    mainPage!.setState((){
      mainPage.pageIdx = idx;
    });
  }
}