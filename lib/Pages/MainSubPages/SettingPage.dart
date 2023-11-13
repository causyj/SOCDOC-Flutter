import 'package:flutter/material.dart';

import 'package:socdoc_flutter/Utils/AuthUtil.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return(
      Column(
        children: [
          const Text("Setting Page"),
          ElevatedButton(
            onPressed: (){
              tryLogout();
            },
            child: const Text("Logout User")
          )
        ]
      )

    );
  }
}