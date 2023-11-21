import 'package:flutter/material.dart';
import 'package:socdoc_flutter/Pages/MainSubPages/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socdoc_flutter/Utils/HospitalTypes.dart';
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
    loadSelectedIndices();
  }

  Future<void> saveSelectedIndices(List<int> indices) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('selectedIndices', indices.map((index) => index.toString()).toList());
  }
  void navigateToHomePage(List<int> selectedIndices) {
    // SharedPreferences에 선택한 인덱스 저장
    saveSelectedIndices(selectedIndices);

    // HomePage로 이동할 때 새로운 selectedIndices를 전달
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(selectedIndices: selectedIndices),
      ),
    );
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
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 25.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Opacity(
              opacity: 0.3,
              child: SizedBox(
                width: 250.0,
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/socdoc_title_logo.png'),
                ),
              ),
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
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text("선택하신 병원은 메인화면에 즐겨찾는 병원으로 등록됩니다"),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GridView.builder(
                    itemCount: HospitalTypes
                        .where((item) => item.ko.isNotEmpty)
                        .length-1,
                    itemBuilder: (context, index) {
                      HospitalItem hospitalItem = HospitalTypes
                          .where((item) => item.ko.isNotEmpty)
                          .elementAt(index+1);

                      return
                        GestureDetector(
                          onTap: () {
                            // 선택한 타일의 인덱스를 저장
                            saveSelectedIndices(selectedTileIndices);
                            navigateToHomePage(selectedTileIndices);
                          },
                          child: Container(

                            decoration: BoxDecoration(
                              border: Border(

                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                                left: BorderSide(
                                  color: index.isEven ? Colors.white : Colors
                                      .grey,
                                  width: 2.0,
                                ),
                                right: BorderSide(
                                  color: index.isEven ? Colors.grey : Colors
                                      .white,
                                  width: 2.0,
                                ),
                              ),
                              color: selectedTileIndices.contains(index)
                                  ? Colors
                                  .blue
                                  : Colors.white,
                            ),
                            child: ListTile(
                              tileColor: Colors.white,
                              onTap: () {
                                setState(() {
                                  if (selectedTileIndices.contains(index)) {
                                    selectedTileIndices.remove(index);
                                  } else {
                                    if (selectedTileIndices.length < 4) {
                                      selectedTileIndices.add(index);
                                    }
                                  }
                                });
                              },
                              leading: Container(
                                width: 50,
                                height: 50,

                                child: Image.asset(
                                  'assets/hospital/${hospitalItem.num}.png',
                                  fit: BoxFit.cover,

                                ),
                              ),
                              title: Text(
                                hospitalItem.ko,
                                key: Key('text_$index'),
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
            Expanded(child:  Text("Selected Tile Indices: ${selectedTileIndices}"),)
          ],
        ),
      ),
    );
  }
}