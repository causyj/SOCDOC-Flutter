import 'package:flutter/material.dart';

import 'package:socdoc_flutter/Pages/MainPage.dart';

class SocdocBottomNav extends StatefulWidget {
  const SocdocBottomNav({super.key});

  @override
  State<StatefulWidget> createState() => SocdocBottomNavState();
}

class SocdocBottomNavState extends State<SocdocBottomNav> {
  @override
  Widget build(BuildContext context) {
    var mainPage = context.findAncestorStateOfType<MainPageState>();
    return Text("SOCDOC Bottom Nav");
  }
}