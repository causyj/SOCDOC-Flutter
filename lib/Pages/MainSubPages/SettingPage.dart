import 'package:flutter/material.dart';
import 'package:socdoc_flutter/Utils/AuthUtil.dart';
import 'package:socdoc_flutter/main.dart';
import 'package:socdoc_flutter/Utils/Color.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key});

  @override
  Widget build(BuildContext context) {
    SocdocAppState socdocApp = context.findAncestorStateOfType<SocdocAppState>()!;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserInfo("Dev.LR", "서울특별시 동작구"),
            SizedBox(height: 20.0),
            myPageList("즐겨찾기 병원 목록", Icons.favorite_border),
            favoriteHospital(),
            SizedBox(height: 20.0),
            myPageList("내 리뷰 보기", Icons.rate_review_outlined),
            myReviewList(),
            buildTextButton("로그아웃", () => tryFirebaseLogout(socdocApp)),
            buildTextButton("회원 탈퇴", () => tryFirebaseDeleteUser(socdocApp)),
          ],
        ),
      ),
    );
  }

  Widget UserInfo(String name, String address) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 75,
            height: 75,
            child: ClipOval(
              child: Image(
                image: AssetImage('assets/user.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 25.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(name, style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                  Icon(Icons.settings, color: AppColor.SocdocBlue),
                ],
              ),
              SizedBox(height: 3.0),
              Text(address, style: TextStyle(fontSize: 15.0, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget myPageList(String text, icon) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 20.0),
          Text(text, style: TextStyle(fontSize: 18.0)),
        ],
      ),
    );
  }

  Widget HospitalInfo(String name, String address, String img) {
    return Container(
      width: 200,
      height: 160,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26, width: 0.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(img), width: 200, height: 100, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: AppColor.SocdocBlue)),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 15),
                      Text(address, style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, color: Colors.black54)),
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

  Widget favoriteHospital(){
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            HospitalInfo("흑석성모안과의원", "동작구 상도로 36길", 'assets/hospital2.png'),
            SizedBox(width: 35.0),
            HospitalInfo("연세이비인후과", "동작구 상도로 17길", 'assets/hospital3.png'),
            SizedBox(width: 35.0),
            HospitalInfo("서울성모안과의원", "동작구 상도로 36길", 'assets/hospital2.png'),
          ],
        ),
      ),
    );
  }

  Widget myReviewList(){
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          myReview("흑석성모안과의원", "2023.09.01", "다 좋은데 줄이 너무 길어요..", "4.0", 'assets/hospital2.png'),
          SizedBox(height: 10.0),
          myReview("연세이비인후과", "2023.10.23", "간호사가 별로에요.", "3.0", 'assets/hospital3.png'),
        ],
      ),
    );
  }

  Widget myReview(String name, String date, String comment, String rate, String img) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                child: ClipOval(
                  child: Image(
                    image: AssetImage(img),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 16)),
                  Text(date, style: TextStyle(fontSize: 10, color: Colors.grey)),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Icon(Icons.star_rounded, color: Colors.amberAccent),
                  Text(rate),
                ],
              ),
              SizedBox(width: 10.0),
            ],
          ),
          SizedBox(height: 10.0),
          Container(
            child: Container(
              width: 300,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.SocdocBlue, width: 0.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 15.0, bottom: 5.0),
                    child: Text(comment, style: TextStyle(fontSize: 15, color: AppColor.SocdocBlue)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget buildTextButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  void tryFirebaseLogout(SocdocAppState socdocApp) async {
    if (await tryLogout()) {
      socdocApp.setState(() {
        //socdocApp.isLoggedIn = false;
      });
    }
  }

  void tryFirebaseDeleteUser(SocdocAppState socdocApp) async {
    if (await tryDeleteUser()) {
      socdocApp.setState(() {
        //socdocApp.isLoggedIn = false;
      });
    }
  }
}