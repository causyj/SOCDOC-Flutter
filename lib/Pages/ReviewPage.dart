import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/socdoc_title_logo.png',
            fit: BoxFit.contain,
            height: 180,
            width: 200,
            color: Colors.white.withOpacity(0.3), colorBlendMode: BlendMode.modulate,
          ),
          // 별점 위젯 추가
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
              ],
            ),
          ),
          // 사진 첨부 버튼 추가
          ElevatedButton(
            onPressed: () {
              // 사진 첨부 버튼이 눌렸을 때의 동작 추가
            },
            child: Text("사진 첨부"),
          ),
          // 리뷰 입력 필드 추가
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "리뷰를 작성하세요",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // 작성하기 버튼 추가
          ElevatedButton(
            onPressed: () {
              // 작성하기 버튼이 눌렸을 때의 동작 추가
            },
            child: Text("작성하기"),
          ),
        ],
      ),
    );
  }
}
