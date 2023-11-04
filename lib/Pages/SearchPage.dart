import 'package:flutter/material.dart';

import 'package:socdoc_flutter/Pages/DetailPage.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text("Search Page"),
            ElevatedButton(
              child: const Text("Detail Page"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
              }
            )
          ]
        )
      )
    );
  }
}