import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return(
      Scaffold(
        body: (
          SafeArea(
            child: (
              Column(
                children: [
                  const Text("Login Page"),
                  ElevatedButton(
                    onPressed: (){},
                    child: const Text("Login")
                  )
                ],
              )
            )
          )
        )
      )
    );
  }
}