import 'package:flutter/material.dart';
import 'package:socdoc_flutter/Utils/AuthUtil.dart';
import 'package:socdoc_flutter/main.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key});

  @override
  Widget build(BuildContext context) {
    SocdocAppState socdocApp = context.findAncestorStateOfType<SocdocAppState>()!;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildUserInfoContainer(),
            SizedBox(height: 40.0),
            ExpansionPanelListExample(),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                tryFirebaseLogout(socdocApp);
              },
              child: const Text("로그아웃", style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold)),
            ),
            TextButton(
              onPressed: () {
                tryFirebaseDeleteUser(socdocApp);
              },
              child: const Text("회원 탈퇴", style: TextStyle(color: Colors.black, fontSize:16.0, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUserInfoContainer() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
        color: Colors.white,
      ),
      child: buildUserInfoRow(),
    );
  }

  Widget buildUserInfoRow() {
    return Row(
      children: [
        SizedBox(width: 10.0),
        buildUserAvatar(),
        SizedBox(width: 20.0),
        buildUserInfoColumn(),
      ],
    );
  }

  Widget buildUserAvatar() {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/user.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildUserInfoColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '사용자 님',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        SizedBox(height: 2.0),
        Text('서울특별시 동작구', style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  void tryFirebaseLogout(SocdocAppState socdocApp) async {
    if (await tryLogout()) {
      socdocApp.setState(() {
        //socdocApp.isLoggedIn = false;
      });
    }
  }

  void tryFirebaseDeleteUser(SocdocAppState socdocApp) async {
    if (await tryDeleteUser()) {
      socdocApp.setState(() {
        //socdocApp.isLoggedIn = false;
      });
    }
  }
}


class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    required this.icon,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  Icon icon;
  bool isExpanded;
}

List<Item> generateItems() {
  return [
    Item(
      headerValue: '우리 동네 수정',
      expandedValue: 'Details for 우리 동네 수정',
      icon: Icon(Icons.home_work_outlined),
    ),
    Item(
      headerValue: '내 정보 수정',
      expandedValue: 'Details for 내 정보 수정',
      icon: Icon(Icons.people_alt_outlined),
    ),
    Item(
      headerValue: '즐겨찾는 병원',
      expandedValue: 'Details for 즐겨찾는 병원',
      icon: Icon(Icons.favorite_border),
    ),
    Item(
      headerValue: '마이 리뷰 보기',
      expandedValue: 'Details for 마이 리뷰 보기',
      icon: Icon(Icons.rate_review_outlined),
    ),
  ];
}

class ExpansionPanelListExample extends StatefulWidget {
  const ExpansionPanelListExample({super.key});

  @override
  State<ExpansionPanelListExample> createState() =>
      _ExpansionPanelListExampleState();
}

class _ExpansionPanelListExampleState extends State<ExpansionPanelListExample> {
  final List<Item> _data = generateItems();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: item.icon,
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

