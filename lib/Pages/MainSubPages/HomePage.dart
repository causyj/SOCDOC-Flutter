import 'package:flutter/material.dart';
import 'package:socdoc_flutter/Pages/MainSubPages/HomeShortcut.dart';
import '../../Utils/Color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
    Widget SpecialtyCard(String specialty){
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
                    child: Image(
                      image: AssetImage('assets/images/eye.png'),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeShortcut()));
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
          Row(
            children: [
              SpecialtyCard("소아과"),
              Padding(
                padding: const EdgeInsets.only(left:5.0),
                child: SpecialtyCard("치과"),
              ),
              Padding(
                padding: const EdgeInsets.only(left:5.0),
                child: SpecialtyCard("안과"),
              ),
              Padding(
                padding: const EdgeInsets.only(left:5.0),
                child: SpecialtyCard("정형외과"),
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
      SingleChildScrollView(
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
      );
  }
}