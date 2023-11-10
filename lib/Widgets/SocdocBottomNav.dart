import 'package:flutter/material.dart';

import 'package:socdoc_flutter/Pages/MainPage.dart';
import 'package:socdoc_flutter/Pages/SearchPage.dart';
import 'package:socdoc_flutter/main.dart';

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
          mainPage.pageIdx == 0
              ? IconButton(
                  onPressed: (){openSearch();},
                  icon: const Icon(Icons.search))
              : IconButton(
                  onPressed: (){openSearch();},
                  icon: const Icon(Icons.search)),
          mainPage.pageIdx == 1
              ? IconButton(
                  onPressed: (){updateIdx(1);},
                  icon: const Icon(Icons.home))
              : IconButton(
                  onPressed: (){updateIdx(1);},
                  icon: const Icon(Icons.home)),
          mainPage.pageIdx == 2
              ? IconButton(
                  onPressed: (){updateIdx(2);},
                  icon: const Icon(Icons.person))
              : IconButton(
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