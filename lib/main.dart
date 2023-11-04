import 'package:flutter/material.dart';
import 'package:socdoc_flutter/Pages/MainPage.dart';

void main() {
  runApp(const SocdocApp());
}

class SocdocApp extends StatefulWidget {
  const SocdocApp({super.key});

  @override
  State<StatefulWidget> createState() => _SocdocAppState();
}

class _SocdocAppState extends State<SocdocApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SOCDOC",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true
      ),
      home: MainPage(),
    );
  }
}
