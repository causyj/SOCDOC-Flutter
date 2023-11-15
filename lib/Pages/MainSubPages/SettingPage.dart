import 'package:flutter/material.dart';

import 'package:socdoc_flutter/Utils/AuthUtil.dart';
import 'package:socdoc_flutter/main.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SocdocAppState socdocApp = context.findAncestorStateOfType<SocdocAppState>()!;

    return(
      Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                // 왼쪽 이미지
                Container(
                  width: 50.0, // 이미지 너비 조절
                  height: 50.0, // 이미지 높이 조절
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/user.png'), // 이미지 경로 추가
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16.0), // 이미지와 텍스트 간격 조절
                // 오른쪽 텍스트
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '박지우님',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('서울특별시 동작구'),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: (){
              tryFirebaseLogout(socdocApp);
            },
            child: const Text("로그아웃")
          ),
          ElevatedButton(
              onPressed: (){
                tryFirebaseDeleteUser(socdocApp);
              },
              child: const Text("회원 탈퇴")
          )
        ]
      )
    );
  }

  void tryFirebaseLogout(SocdocAppState socdocApp) async {
    if(await tryLogout()){
      socdocApp.setState(() {
        //socdocApp.isLoggedIn = false;
      });
    }
  }

  void tryFirebaseDeleteUser(SocdocAppState socdocApp) async {
    if(await tryDeleteUser()){
      socdocApp.setState(() {
        //socdocApp.isLoggedIn = false;
      });
    }
  }
}