import 'package:flutter/material.dart';

import 'Pages/LoginPage.dart';
import 'Pages/MainPage.dart';

void main() {
  runApp(const SocdocApp());
}

class SocdocApp extends StatefulWidget {
  const SocdocApp({super.key});

  @override
  State<StatefulWidget> createState() => _SocdocAppState();
}

class _SocdocAppState extends State<SocdocApp> {
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SOCDOC",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true
      ),
      home: isLoggedIn ? LoginPage() : MainPage(),
    );
  }
}