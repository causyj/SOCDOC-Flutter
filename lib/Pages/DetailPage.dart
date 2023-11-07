import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final edgeInsets = EdgeInsets.only(left: 16.0, top: 5.0);
    final detailTextStyle = TextStyle(fontSize: 16);
    final detailPharmacyStyle = TextStyle(fontSize: 17, fontWeight: FontWeight.bold);
    final titlePharmacy = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

    Widget detailHospital(IconData icon, String text) {
      return Row(
        children: [
          Padding(padding: edgeInsets, child: Icon(icon)),
          Padding(padding: EdgeInsets.only(left: 10.0, top: 5.0)),
          Text(text, style: detailTextStyle),
        ],
      );
    }

    Widget detailPharmacy(String text) {
      return Row(
        children: [
          Padding(padding: edgeInsets, child: Icon(Icons.location_on)),
          Padding(padding: EdgeInsets.only(left: 10.0)),
          Text(text, style: detailPharmacyStyle),
        ],
      );
    }

    Widget nearbyPharmacy(String text) {
      return SizedBox(
        height: 110, width: 350,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 4.0,
          surfaceTintColor: Colors.transparent,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 15.0, bottom: 5.0),
                child: Text(text, style: titlePharmacy),
              ),
              detailPharmacy("동작구 상도동 4길 36"),
            ],
          ),
        ),
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
                    detailHospital(Icons.call, "02-1234-5678"),
                    detailHospital(Icons.location_on, "동작구 상도동 4길 36"),
                    detailHospital(Icons.subway, "상도역 5번 출구"),
                    detailHospital(Icons.alarm, "진료 시간"),
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
                    Center(child: Text("리뷰")),
                    // 두 번째 탭의 내용
                    Center(child: nearbyPharmacy("상도 온누리 약국")),
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
