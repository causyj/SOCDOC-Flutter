import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:socdoc_flutter/Utils/AuthUtil.dart';

import 'package:socdoc_flutter/firebase_options.dart';
import 'package:socdoc_flutter/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoginNeeded = false;
  SocdocAppState? socdocApp;

  @override
  void initState() {
    super.initState();
    checkLastLogin();
  }

  @override
  Widget build(BuildContext context) {
    socdocApp = context.findAncestorStateOfType<SocdocAppState>();

    return Scaffold(
      body: SafeArea(
        child: (
          Column(
            children: [
              const Text("Login Page"),
              ElevatedButton(
                onPressed: (){
                  socdocApp!.setState(() {
                    socdocApp!.isLoggedIn = true;
                  });
                },
                child: const Text("Goto Main")
              ),
              _isLoginNeeded ? _LoginButtons() : const Text("Already Logged in")
            ],
          )
        )
      )
    );
  }

  void checkLastLogin() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) async {
        if(user != null && socdocApp != null){
          socdocApp!.setState(() {
            socdocApp!.isLoggedIn = true;
          });
        }else{
          setState(() {
            _isLoginNeeded = true;
          });
        }
      });
  }
}

class _LoginButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          child: const Text("Sign in with Google"),
          onPressed: (){
            tryGoogleLogin();
          }
        ),
        Platform.isIOS ? ElevatedButton(
          child: const Text("Sign in with Apple"),
          onPressed: (){
            tryAppleLogin();
          }
        ):const SizedBox.shrink()
      ]
    );
  }
}