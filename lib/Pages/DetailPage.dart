import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 400,
              height: 200,
              child: Image(
                image: AssetImage('assets/images/hospital1.png'),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "서울성모안과의원",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      Icon(Icons.favorite_rounded, color: Colors.pink),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.0), // 왼쪽에 간격 추가
                        child: Icon(Icons.call),
                      ),
                      Padding(padding: EdgeInsets.only(left: 10.0)),
                      Text("02-1234-5678"),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Icon(Icons.location_on),
                      ),
                      Padding(padding: EdgeInsets.only(left: 10.0)),
                      Text("동작구 상도동 4길 36"),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Icon(Icons.subway),
                      ),
                      Padding(padding: EdgeInsets.only(left: 10.0)),
                      Text("상도역 5번 출구"),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Icon(Icons.alarm),
                      ),
                      Padding(padding: EdgeInsets.only(left: 10.0)),
                      Text("진료 시간"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
