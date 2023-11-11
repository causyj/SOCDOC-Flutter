import 'package:flutter/material.dart';
import 'package:socdoc_flutter/Utils/Color.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.SocdocBlue),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 왼쪽에 close 아이콘
                    Icon(Icons.close),
                    // 가운데에 Text
                    Text('병원 이름', style: TextStyle(fontSize: 20)),
                    // 오른쪽에 완료 버튼
                    ElevatedButton(
                      onPressed: () {
                        // 완료 버튼이 눌렸을 때의 동작 추가
                      },
                      child: Text("완료"),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                RatingBar.builder(
                  initialRating: rating.toDouble(),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 35,
                  itemBuilder: (context, index) {
                    return Icon(
                      index < rating
                          ? Icons.star_rounded
                          : Icons.star_border_rounded,
                      color: Colors.amberAccent,
                    );
                  },
                  onRatingUpdate: (value) {
                    setState(() {
                      rating = value.toInt();
                    });
                  },
                ),
                SizedBox(height: 5),
                Text("별점을 선택해주세요!", style: TextStyle(fontSize: 15)),
              ],
            ),
          ),

          SizedBox(height: 20),

          // 리뷰 입력 필드 추가
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "어떤 점이 좋았는지 혹은 아쉬웠는지 솔직하게 적어주세요:)",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
