import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:socdoc_flutter/Pages/MainSubPages/HomeShortcut.dart';
import 'package:socdoc_flutter/Utils/HospitalTypes.dart';
import '../../Utils/Color.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> selectedTileIndices = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(
      _LifecycleObserver(resumeCallback: () async => loadSelectedIndices())
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadSelectedIndices();
    });
  }

  Future<void> loadSelectedIndices() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedIndices = prefs.getStringList('selectedIndices');

    if (storedIndices != null && storedIndices.length == 4) {
      setState(() {
        selectedTileIndices = storedIndices.map((index) => int.parse(index)).toList();
      });
    }else{
      setState(() {
        selectedTileIndices = [1,5,8,12];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final edgeInsets = EdgeInsets.only(left: 16.0, top: 5.0);
    final detailTextStyle = TextStyle(fontSize: 16);
    final detailHospitalStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    final titleHospital = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColor.SocdocBlue);
    final pagetitle = TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold);
    Widget Location(){
      return Container(
        width: double.infinity,
        height: 100.0,
        decoration:  BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black54,
              blurRadius: 20.0,
              spreadRadius: -20.0,
              offset: Offset(0.0, 25.0),
            )
          ],
          color: AppColor.SocdocBlue,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        child :
        Container(
          margin : const EdgeInsets.all(25),
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color : Colors.white,
                size : 35.0,
              ),
              SizedBox(width: 10.0),
              Text('서울시 동작구',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21.0,
                    fontWeight:
                    FontWeight.bold),),

            ],
          ),

        ),
      );
    }
    Widget SpecialtyCard(String specialty, int n){
      return Padding(
        padding: const EdgeInsets.only(top:10.0),
        child:
        Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Container(
                width: 80,
                height: 80,
                child: Center(
                  child: Container(
                    width: 40,
                    height: 40,
                    child:
                    Image(
                      image: AssetImage('assets/hospital/${HospitalTypes[selectedTileIndices[n]].num}.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height:10.0),
            Text(specialty,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0, ),
            ),
          ],
        ),

      );
    }
    Widget NearbyHospital(){
      return Column(
        children: [
          Row(
            children: [
              Text('우리 동네 병원 한 눈에 보기', style: pagetitle),
              SizedBox(width: 5.0),
              GestureDetector(
                onTap:((){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeShortcut())).then((value) => loadSelectedIndices());
                }),

                child:Icon(
                  Icons.
                  settings,
                  color : Colors.black,
                  size : 30.0,
                ),
              ),
            ],
          ),
          SizedBox(width: 10.0,),
          Text("Selected Tile Indices: ${selectedTileIndices}"),
          Row(
            children: [
              SpecialtyCard(HospitalTypes[selectedTileIndices[0]].ko,0),
              Padding(
                padding: const EdgeInsets.only(left:5.0),
                child: SpecialtyCard(HospitalTypes[selectedTileIndices[1]].ko ,1),
              ),
              Padding(
                padding: const EdgeInsets.only(left:5.0),
                child: SpecialtyCard(HospitalTypes[selectedTileIndices[2]].ko,2),
              ),
              Padding(
                padding: const EdgeInsets.only(left:5.0),
                child: SpecialtyCard(HospitalTypes[selectedTileIndices[3]].ko,3),
              ),
            ],
          ),
        ],
      );
    }
    Widget HospitalAddress(String text) {
      return Row(
        children: [
          Padding(padding: edgeInsets, child: Icon(Icons.location_on)),
          Padding(padding: EdgeInsets.only(left: 10.0)),
          Text(text, style: detailHospitalStyle),
        ],
      );
    }
    Widget HospitalCard(String text) {
      return
        SizedBox(
          height: 265, width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 10.0,
            surfaceTintColor: Colors.transparent,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 12.0,right:12.0, top:12.0, bottom:2.0 ),
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0), // 여기서 원하는 둥근 정도를 설정합니다.
                      child:  Image(
                        image: AssetImage('assets/images/hospital1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(text, style: titleHospital),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:5.0),
                            child: Icon(Icons.star_rounded, color: Colors.amberAccent),
                          ),
                          Text("5.0"),
                        ],
                      ),
                    ],
                  ),
                ),
                HospitalAddress("동작구 상도동 4길 36"),
              ],
            ),
          ),
        );
    }
    Widget FamousHospital(){
      return Container(
        child:
        Padding(
          padding: const EdgeInsets.only(top:25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('우리 동네 인기 병원', style: pagetitle ),
              Container(
                margin: EdgeInsets.only(top: 5.0), // Text와 NearbyPharmacy 사이의 간격을 설정
                child: Column(
                  children: [
                    HospitalCard('서울연세이비인후과'),

                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }


    return
      Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child:
          Column(
            children: [
              Location(),
              Padding(
                  padding: EdgeInsets.only(top: 25.0, left:20.0,right:20.0),
                  child: Column(
                    children: [
                      NearbyHospital(),
                      FamousHospital(),
                    ],
                  )
              ),

            ],
          ),
        ),
      );
  }
}

class _LifecycleObserver extends WidgetsBindingObserver {
  final AsyncCallback? resumeCallback;

  _LifecycleObserver({
    this.resumeCallback
  });

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    switch(state) {
      case AppLifecycleState.resumed:
        if(resumeCallback != null){
          await resumeCallback!();
        }
        break;
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
        break;
    }
  }
}