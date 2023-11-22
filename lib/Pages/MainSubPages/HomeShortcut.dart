import 'package:flutter/material.dart';
import 'package:socdoc_flutter/Pages/MainSubPages/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socdoc_flutter/Utils/HospitalTypes.dart';
import 'package:socdoc_flutter/style.dart';
class HomeShortcut extends StatefulWidget {
  @override
  _HomeShortcut createState() => _HomeShortcut();
}

class _HomeShortcut extends State<HomeShortcut> {
  // const _HomeShortcut({super.key});
  List<int> selectedTileIndices = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      loadSelectedIndices();
    });
  }

  Future<void> saveSelectedIndices() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('selectedIndices', selectedTileIndices.map((index) => index.toString()).toList())
        .then((value) => navigateToHomePage());
  }
  void updateSelectedIndices(List<int> updatedIndices) {
    setState(() {
      selectedTileIndices = updatedIndices;
    });
  }
  void navigateToHomePage() {
    Navigator.pop(context);
  }

  Future<void> loadSelectedIndices() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedIndices = prefs.getStringList('selectedIndices');

    if (storedIndices != null) {
      setState(() {
        selectedTileIndices = storedIndices.map((index) => int.parse(index)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveSelectedIndices();
        },

        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Customize the border radius
        ),
        child:Icon(
          Icons.done_rounded,
          size: 30.0, // Adjust the icon size
          color: Colors.black, // Customize the icon color
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 25.0, right: 16.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Opacity(
                opacity: 0.3,

              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "자주 가는 병원 4개를 선택해주세요 !",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                        child: Text("선택하신 병원은 메인화면에 즐겨찾는 병원으로 등록됩니다"),
                      ),

                    ],
                  ),
                ),
              ),
              Container(
                height: 620.0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25), // 좌측 상단
                        topRight: Radius.circular(25), // 우측 상단
                        bottomLeft: Radius.circular(25), // 좌측 하단
                        bottomRight: Radius.circular(25), // 우측 하단
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey, // 그림자의 색상 및 투명도
                          spreadRadius: 2,  // 그림자의 확산 정도
                          blurRadius: 5,    // 그림자의 흐림 정도
                          offset: Offset(1, 1), // 그림자의 위치 (수평, 수직)
                        ),
                      ],
                     ),

                    child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: GridView.builder(
                          itemCount: HospitalTypes
                              .where((item) => item.ko.isNotEmpty)
                              .length-1,
                          itemBuilder: (context, index) {
                            HospitalItem hospitalItem = HospitalTypes
                                .where((item) => item.ko.isNotEmpty)
                                .elementAt(index+1);

                            return
                              Container(

                                decoration: BoxDecoration(
                                  border: Border(

                                    bottom: BorderSide(
                                      color: index >= HospitalTypes.where((item) => item.ko.isNotEmpty).length - 3 ?
                                      Colors.transparent : AppColor.GridLineStyle,
                                      width: 2.0,
                                    ),

                                    right: BorderSide(
                                      color: index.isEven ?AppColor.GridLineStyle : Colors.transparent,
                                      width: 2.0,
                                    ),

                                  ),
                                ),
                                child: ListTile(
                                  tileColor: Colors.white,
                                  onTap: () {
                                    setState(() {
                                      if (selectedTileIndices.contains(hospitalItem.num)) {
                                        selectedTileIndices.remove(hospitalItem.num);
                                      } else {
                                        if (selectedTileIndices.length < 4) {
                                          selectedTileIndices.add(hospitalItem.num);
                                        }
                                      }
                                    });
                                  },
                                  leading: Container(
                                    width: 45,
                                    height:45,

                                    child: Image.asset(
                                      'assets/hospital/${hospitalItem.num}.png',
                                      fit: BoxFit.cover,

                                    ),
                                  ),
                                  title: Text(
                                    hospitalItem.ko,
                                    key: Key('text_$index'),
                                    // style: TextStyle(color: AppColor.GridTextStyle),
                                    style: TextStyle(
                                      color: selectedTileIndices.contains(hospitalItem.num) ? AppColor.GridTextStyleOnPressed :  AppColor.GridTextStyle,
                                      fontWeight: selectedTileIndices.contains(hospitalItem.num) ? FontWeight.bold : FontWeight.normal  ,
                                    ),
                                  ),
                                ),
                              );
                          },
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3,
                          ),
                        )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}