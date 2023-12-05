import 'package:flutter/material.dart';

class SettingAddressPage extends StatelessWidget {
  const SettingAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SettingAddressPage'),
      ),
      body: const Center(
        child: Text('우리 동네 수정 페이지'),
      ),
    );
  }
}