import 'package:flutter/material.dart';
import 'package:socdoc_flutter/Utils/AuthUtil.dart';
import 'package:socdoc_flutter/main.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key});

  @override
  Widget build(BuildContext context) {
    SocdocAppState socdocApp = context.findAncestorStateOfType<SocdocAppState>()!;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildUserInfoContainer(),
          TextButton(
            onPressed: () {
              tryFirebaseLogout(socdocApp);
            },
            child: const Text("로그아웃", style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold)),
          ),
          TextButton(
            onPressed: () {
              tryFirebaseDeleteUser(socdocApp);
            },
            child: const Text("회원 탈퇴", style: TextStyle(color: Colors.black, fontSize:16.0, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget buildUserInfoContainer() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
        color: Colors.white,
      ),
      child: buildUserInfoRow(),
    );
  }

  Widget buildUserInfoRow() {
    return Row(
      children: [
        SizedBox(width: 10.0),
        buildUserAvatar(),
        SizedBox(width: 20.0),
        buildUserInfoColumn(),
      ],
    );
  }

  Widget buildUserAvatar() {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/user.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildUserInfoColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '사용자 님',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        SizedBox(height: 2.0),
        Text('서울특별시 동작구', style: TextStyle(color: Colors.grey)),
      ],
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
