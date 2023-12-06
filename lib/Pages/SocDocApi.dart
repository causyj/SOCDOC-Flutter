// SocDocApi.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class SocDocApi {
  static Future<Map<String, dynamic>> fetchHospitalDetail() async {
    var url = Uri.parse("https://socdoc.dev-lr.com/api/hospital/detail?hospitalId=A1100001&userId=${FirebaseAuth.instance.currentUser!.uid}");
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      print("에러 발생: ${response.statusCode}");
      print("에러 내용: ${response.body}");
      throw Exception("API 호출 중 오류 발생");
    }
  }
}
