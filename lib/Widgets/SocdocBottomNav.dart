import 'package:flutter/material.dart';

class SocdocBottomNav extends StatefulWidget {
  const SocdocBottomNav({super.key});

  @override
  State<StatefulWidget> createState() => SocdocBottomNavState();
}

class SocdocBottomNavState extends State<SocdocBottomNav> {
  var pageIdx = 1;
  
  @override
  Widget build(BuildContext context) {
    return Text("SOCDOC Bottom Nav");
  }
}