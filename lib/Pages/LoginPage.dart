import 'package:flutter/material.dart';

import 'package:socdoc_flutter/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final socdocApp = context.findAncestorStateOfType<SocdocAppState>();

    return Scaffold(
      body: SafeArea(
        child: (
          Column(
            children: [
              const Text("Login Page"),
              ElevatedButton(
                onPressed: (){
                  socdocApp!.setState(() {
                    socdocApp.isLoggedIn = true;
                  });
                },
                child: const Text("Login")
              )
            ],
          )
        )
      )
    );
  }
}