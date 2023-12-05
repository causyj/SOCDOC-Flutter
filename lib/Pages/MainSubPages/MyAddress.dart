import 'package:flutter/material.dart';

class MyAddress extends StatelessWidget {
  const MyAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Address'),
      ),
      body: const Center(
        child: Text('우리 동네 수정 페이지'),
      ),
    );
  }
}