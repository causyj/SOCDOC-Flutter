import 'package:flutter/material.dart';
import 'package:socdoc_flutter/Utils/Color.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final edgeInsets = EdgeInsets.only(left: 16.0, top: 5.0);
    final detailTextStyle = TextStyle(fontSize: 16);
    final detailPharmacyStyle = TextStyle(fontSize: 17, fontWeight: FontWeight.bold);
    final titlePharmacy = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.SocdocBlue);

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

    //주변 약국 tabview
    Widget nearbyPharmacy(String text) {
      return SizedBox(
        height: 110, width: 350,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 10.0,
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
    Widget reviewTab() {
      return Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("전체 평점", style: detailTextStyle),
                SizedBox(width: 10.0),
                Icon(Icons.star_rounded, color: Colors.amberAccent),
                Text("4.3", style: detailTextStyle),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: ClipOval(
                    child: Image(
                      image: AssetImage('assets/images/hospital1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("DEV.LR", style: TextStyle(fontSize: 18)),
                    Text("2023.09.23"),
                  ],
                ),
                SizedBox(width: 200.0),
                Column(
                  children: [
                    Icon(Icons.star_rounded, color: Colors.amberAccent),
                    Text("5.0"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerRight,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: AppColor.SocdocBlue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
                  mainAxisAlignment: MainAxisAlignment.start, // 위쪽 정렬
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 15.0, bottom: 5.0),
                      child: Text("줄이 너무 길어요", style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    SizedBox(
                      height: 30, width: 320,
                    ),
                  ],
                ),
              ),
            ),
          ],
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
                    fontSize: 18, color: AppColor.SocdocBlue),
                ),),
                Tab(child: Text("주변 약국", style: TextStyle(
                    fontSize: 18, color: AppColor.SocdocBlue),
                ),),
              ]),
              Expanded(
                child: TabBarView(
                  children: [
                    // 첫 번째 탭의 내용
                    Tab(child: reviewTab()),
                    // 두 번째 탭의 내용
                    Tab(child: nearbyPharmacy("상도 온누리 약국")),
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
