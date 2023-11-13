import 'package:flutter/material.dart';

import 'package:socdoc_flutter/Utils/AuthUtil.dart';
import 'package:socdoc_flutter/main.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SocdocAppState socdocApp = context.findAncestorStateOfType<SocdocAppState>()!;

    return(
      Column(
        children: [
          const Text("Setting Page"),
          ElevatedButton(
            onPressed: (){
              tryFirebaseLogout(socdocApp);
            },
            child: const Text("Logout User")
          )
        ]
      )
    );
  }

  void tryFirebaseLogout(SocdocAppState socdocApp) async {
    if(await tryLogout()){
      socdocApp.setState(() {
        socdocApp.isLoggedIn = false;
      });
    }
  }
}