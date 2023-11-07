import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final edgeInsets = EdgeInsets.only(left: 16.0, top: 5.0);
    final textStyle = TextStyle(fontSize: 16);

    Widget buildRowWithIcon(IconData icon, String text) {
      return Row(
        children: [
          Padding(padding: edgeInsets, child: Icon(icon)),
          Padding(padding: EdgeInsets.only(left: 10.0, top: 5.0)),
          Text(text, style: textStyle),
        ],
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "서울성모안과의원",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(width: 65.0),
                        Column(
                          children: [
                            Icon(Icons.favorite_rounded, color: Colors.pink, size: 30.0),
                            Text('3'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    buildRowWithIcon(Icons.call, "02-1234-5678"),
                    buildRowWithIcon(Icons.location_on, "동작구 상도동 4길 36"),
                    buildRowWithIcon(Icons.subway, "상도역 5번 출구"),
                    buildRowWithIcon(Icons.alarm, "진료 시간"),
                  ],
                ),
              ),
              const TabBar(tabs: [
                Tab(child: Text("리뷰", style: TextStyle(
                    fontSize: 18),
                ),),
                Tab(child: Text("주변 약국", style: TextStyle(
                    fontSize: 18),
                ),),
              ]),
              Expanded(
                child: TabBarView(
                  children: [
                    // 첫 번째 탭의 내용
                    Center(child: Text("리뷰 내용")),
                    // 두 번째 탭의 내용
                    Center(child: Text("주변 약국 내용")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
