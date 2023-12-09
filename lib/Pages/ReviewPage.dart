import 'package:flutter/material.dart';
import 'package:socdoc_flutter/Utils/Color.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key, required this.hospitalID, required this.hospitalName});

  final String hospitalID;
  final String hospitalName;

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  var inputRating = 0;
  var inputReviewText = "";
  TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: Center(
                  child: Text(widget.hospitalName, style: const TextStyle(fontSize: 22)),
                ),
              ),
              TextButton(
                child: const Text('완료', style: TextStyle(fontSize: 17, color: AppColor.SocdocBlue)),
                onPressed: () {
                  Navigator.pop(context, reviewController.text);
                }
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildRatingSection() {
    return Center(
      child: Column(
        children: [
          RatingBar.builder(
            initialRating: inputRating.toDouble(),
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemSize: 40,
            itemBuilder: (context, index) {
              return Icon(
                index < inputRating
                    ? Icons.star_rounded
                    : Icons.star_border_rounded,
                color: Colors.amberAccent,
              );
            },
            onRatingUpdate: (value) {
              setState(() {
                inputRating = value.toInt();
              });
            },
          ),
          const SizedBox(height: 5),
          const Text("별점을 선택해주세요!", style: TextStyle(fontSize: 15)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: AppColor.SocdocBlue,
      thickness: 1.0,
    );
  }

  Widget _buildReviewInput() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: reviewController,
            decoration: const InputDecoration(
              hintText: "어떤 점이 좋았는지 혹은 아쉬웠는지\n솔직하게 적어주세요:)",
              hintMaxLines: 2,
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoButton() {
    return TextButton(
      onPressed: () {},
      child: Container(
        width: 100,
        height: 90,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.SocdocBlue,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Column(
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
