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
            myPageList("내 리뷰 보기", Icons.rate_review_outlined),
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
                  Text(name, style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold)),
                  Icon(Icons.settings, color: AppColor.SocdocBlue),
                ],
              ),
              SizedBox(height: 3.0),
              Text(address, style: TextStyle(fontSize: 13.0, color: Colors.grey)),
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
      width: 160,
      height: 135,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.SocdocBlue, width: 0.5),
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
            Image(image: AssetImage(img), width: 160, height: 85, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 좌측 정렬을 위해 추가
                children: [
                  Text(name, style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: AppColor.SocdocBlue)),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 15),
                      Text(address, style: TextStyle(fontSize: 13.0, color: Colors.black54)),
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
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          HospitalInfo("흑석성모안과의원", "동작구 상도로 36길", 'assets/hospital2.png'),
          HospitalInfo("연세이비인후과", "동작구 상도로 17길", 'assets/hospital3.png')
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