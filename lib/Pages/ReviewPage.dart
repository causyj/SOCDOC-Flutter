import 'package:flutter/material.dart';
import 'package:socdoc_flutter/Utils/Color.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int rating = 0;
  TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAppBar(context),
          _buildRatingSection(),
          _buildDivider(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildReviewInput(),
                _buildPhotoButton(),
              ],
            )
          ),
        ],
      ),
    );
  }

  // 리뷰 페이지 상단의 앱 바 부분
  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Center(
                    child: Text('병원 이름', style: TextStyle(fontSize: 22)),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, reviewController.text);
                  },
                  child: Text('완료', style: TextStyle(fontSize: 17, color: AppColor.SocdocBlue)),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  // 별점 선택 부분
  Widget _buildRatingSection() {
    return Center(
      child: Column(
        children: [
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
        ],
      ),
    );
  }

  // 구분선
  Widget _buildDivider() {
    return Divider(
      color: AppColor.SocdocBlue,
      thickness: 1.0,
    );
  }

  // 리뷰 입력 부분
  Widget _buildReviewInput() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: reviewController,
            decoration: InputDecoration(
              hintText: "어떤 점이 좋았는지 혹은 아쉬웠는지\n솔직하게 적어주세요:)",
              hintMaxLines: 2,
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }

  // 사진 추가 버튼
  Widget _buildPhotoButton() {
    return TextButton(
      onPressed: () {},
      child: Container(
        width: 100,
        height: 90,
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
    );
  }
}
