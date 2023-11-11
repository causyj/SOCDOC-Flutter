import 'package:flutter/material.dart';

import 'package:socdoc_flutter/Utils/Color.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/socdoc_title_logo.png',
              fit: BoxFit.contain,
              height: 180,
              width: 200,
              color: Colors.white.withOpacity(0.3), colorBlendMode: BlendMode.modulate,
            ),
            SizedBox(height: 20),

            Row(
              children: [
                Text('별점', style: TextStyle(fontSize: 20, color: AppColor.SocdocBlue)),
                SizedBox(width: 20),
                RatingBar.builder(
                  initialRating: rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 30,
                  itemBuilder: (context, index) {
                    return Icon(
                      index < rating
                          ? Icons.star_rounded // 체크된 별 아이콘
                          : Icons.star_border_rounded, // 체크되지 않은 별 아이콘
                      color: Colors.amberAccent,
                    );
                  },
                  onRatingUpdate: (value) {
                    setState(() {
                      rating = value;
                    });
                  },
                )
              ],
            ),

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
      ),
    );
  }
}
