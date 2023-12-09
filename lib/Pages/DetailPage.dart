import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:socdoc_flutter/Utils/AuthUtil.dart';
import 'package:socdoc_flutter/Utils/Color.dart';
import 'package:socdoc_flutter/Pages/ReviewPage.dart';

import "package:http/http.dart" as http;


class DetailPage extends StatefulWidget {
  const DetailPage({Key? key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final edgeInsets = EdgeInsets.only(left: 16.0, top: 5.0);
  final detailTextStyle = TextStyle(fontSize: 16);
  final detailPharmacyStyle = TextStyle(fontSize: 17, fontWeight: FontWeight.bold);
  final titlePharmacy = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.SocdocBlue);
  var hospitalDetail = null;
  bool isLoading = true;

  Widget detailHospital(IconData icon, String text, {List<dynamic>? dropdownItems}) {
    return Row(
      children: [
        Padding(padding: edgeInsets, child: Icon(icon, size: 23,)),
        Padding(padding: EdgeInsets.only(left: 10.0, top: 5.0)),
        Text(text, style: detailTextStyle),
        if (dropdownItems != null)
          DropdownButton<String>(
            value: dropdownItems[0],
            icon: const Icon(Icons.arrow_drop_down_rounded),
            iconSize: 25,
            elevation: 16,
            style: const TextStyle(color: Colors.black, fontSize: 16),
            onChanged: (String? newValue) {
              setState(() {
                dropdownItems[0] = newValue!;
              });
            },
            items: dropdownItems.map<DropdownMenuItem<String>>((dynamic value) {
              return DropdownMenuItem<String>(
                value: value.toString(),
                child: Text(value),
              );
            }).toList(),
          ),
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
                    image: AssetImage('assets/user.png'),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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

  Widget buildFavoriteIcon() {
    return hospitalDetail["userLiked"] == false
        ? Icon(Icons.favorite_outline_rounded, color: Colors.pink, size: 30.0)
        : Icon(Icons.favorite_rounded, color: Colors.pink, size: 30.0);
  }

  @override
  void initState() {
    super.initState();
    fetchHospitalDetail();
  }

  Future<void> fetchHospitalDetail() async {
      http.get(Uri.parse("https://socdoc.dev-lr.com/api/hospital/detail?hospitalId=A1100001&userId=${getUserID()}"))
        .then((value){
          setState(() {
            hospitalDetail = jsonDecode(value.body)["data"];
            print(value.body);
            print(hospitalDetail);
            isLoading = false;
          });
      })
      .onError((error, stackTrace){
        print(error);
        print(stackTrace);
      });
  }

  Widget displayHospitalDetail(){
    if(isLoading) return CircularProgressIndicator();
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
                    image: AssetImage('assets/hospital3.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 10.0),
                          Text(
                            hospitalDetail["name"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Column(
                            children: [
                              buildFavoriteIcon(),
                              Text(hospitalDetail["likeCount"].toString()),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      detailHospital(Icons.call, hospitalDetail["phone"]),
                      detailHospital(Icons.location_on, hospitalDetail["address"]),
                      detailHospital(Icons.subway, hospitalDetail["description"] == null ? "정보가 없습니다." : hospitalDetail["description"]),
                      detailHospital(
                        Icons.alarm,
                        "진료 시간   ",
                        dropdownItems: hospitalDetail["time"].map((e) => e.toString()).toList(),
                      ),
                    ],
                  ),
                ),
                const TabBar(tabs: [
                  Tab(child: Text("리뷰", style: TextStyle(
                      fontSize: 18, color: AppColor.SocdocBlue),
                  ),
                  ),
                  Tab(child: Text("주변 약국", style: TextStyle(
                      fontSize: 18, color: AppColor.SocdocBlue),
                  ),
                  ),
                ]),
                Expanded(
                  child: TabBarView(
                    children: [
                      // 첫 번째 탭(리뷰)
                      Scaffold(
                        body: reviewTab(),
                        floatingActionButton: FloatingActionButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReviewPage()));
                          },
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.rate_review_outlined,
                            color: AppColor.SocdocBlue,
                          ),
                        ),
                      ),

                      // 두 번째 탭(주변 약국)
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

  @override
  Widget build(BuildContext context) {
    return displayHospitalDetail();
  }
}
