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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          // close 아이콘을 누르면 이전 페이지로 돌아감
                          Navigator.pop(context);
                        },
                      ),
                      Expanded(
                        child: Center(
                          child: Text('병원 이름', style: TextStyle(fontSize: 22)),
                        ),
                      ),
                      Text('완료', style: TextStyle(fontSize: 17, color: AppColor.SocdocBlue)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                RatingBar.builder(
                  initialRating: rating.toDouble(),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 40,
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
                SizedBox(height: 20),
                Divider(
                  color: AppColor.SocdocBlue, // 선의 색상 설정
                  thickness: 1.0, // 선의 두께 설정
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "어떤 점이 좋았는지 혹은 아쉬웠는지\n솔직하게 적어주세요:)",
                    hintMaxLines: 2, // 힌트의 최대 줄 수
                  ),
                ),


                SizedBox(height: 20),

                // 사진 첨부 버튼 추가
                TextButton(
                  onPressed: () {
                    // 사진 첨부 버튼이 눌렸을 때의 동작 추가
                  },
                  child: Container(
                    width: 100, // 원하는 너비로 조절
                    height: 90, // 원하는 높이로 조절
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.SocdocBlue,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.add_a_photo,
                          color: AppColor.SocdocBlue,
                          size: 30,
                        ),
                        SizedBox(height: 8),
                        Text(
                          "사진 추가",
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColor.SocdocBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
