import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return(
      Column(
        children: [
          const Text("Setting Page"),
          ElevatedButton(
            onPressed: (){},
            child: const Text("Logout User")
          )
        ]
      )

    );
  }
}