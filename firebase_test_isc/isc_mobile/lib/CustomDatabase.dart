import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CustomData extends StatefulWidget {
  @override
  _CustomDataState createState() => _CustomDataState();
}

//리스트 불러올 때
DatabaseReference listTypeDb = new FirebaseDatabase().reference();

//단일 개체 불러올 때
// DatabaseReference db = new FirebaseDatabase().reference().child("name");

class _CustomDataState extends State<CustomData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          '장치 목록 관리',
          style: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ),
      drawer: Drawer(
        // column holds all the widgets in the drawer
        child: Column(
          children: <Widget>[
            Expanded(
              // ListView contains a group of widgets that scroll inside the drawer
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 2.0,
                      // minRadius: 3.0,
                    ),
                    margin: EdgeInsets.only(bottom: 15),
                    accountName: Text('San'),
                    accountEmail: Text('mailsec7605@gmail.com'),
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(25.0),
                      ),
                    ),
                  ),
                  ListTile(
                    //왼쪽 끝에 아이콘 배치 하는것.
                    leading: Icon(
                      Icons.collections_bookmark,
                      color: Colors.grey[850], //아이콘의 색을 찐하게 해주는 것.
                    ),
                    title: Text(
                      '장치 목록 관리',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      //onTap은 두번 Touch하거나 쭈욱 눌렀을때 이벤트를 할 수 있는 것.
                      print('Home is Clicked');
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.fact_check,
                      color: Colors.grey[850],
                    ),
                    title: Text(
                      '센서 입력 뷰어',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      print('Setting is Clicked');
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.vertical_split,
                      color: Colors.grey[850],
                    ),
                    title: Text(
                      '개별 강제 실행',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      print('Setting is Clicked');
                    },
                  ),
                  ListTile(
                    //왼쪽 끝에 아이콘 배치 하는것.
                    leading: Icon(
                      Icons.auto_stories,
                      color: Colors.grey[850], //아이콘의 색을 찐하게 해주는 것.
                    ),
                    title: Text(
                      '챕터 간 이동',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      //onTap은 두번 Touch하거나 쭈욱 눌렀을때 이벤트를 할 수 있는 것.
                      print('Home is Clicked');
                    },
                  ),
                ],
              ),
            ),

            // This container holds the align
            Container(
              padding: EdgeInsets.only(bottom: 5),
              // This align moves the children to the bottom
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                // This container holds all the children that will be aligned
                // on the bottom and should not scroll with the above ListView
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Divider(
                        color: Colors.black26,
                        thickness: 0.5,
                      ),
                      ListTile(
                        //왼쪽 끝에 아이콘 배치 하는것.
                        leading: Icon(
                          Icons.logout,
                          color: Colors.grey[850], //아이콘의 색을 찐하게 해주는 것.
                        ),
                        title: Text(
                          '로그아웃',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          //onTap은 두번 Touch하거나 쭈욱 눌렀을때 이벤트를 할 수 있는 것.
                          print('Home is Clicked');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: listTypeDb.onValue,
          builder: (context, AsyncSnapshot<Event> snap) {
            if (!snap.hasData) {
              return Text("로딩 중");
            } else {
              return Column(
                children: <Widget>[
                  Text(
                    snap.data!.snapshot.value.toString(),
                    // snap.data!.snapshot.value.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  // Text(
                  //   snap.data!.snapshot.value.toString(),
                  //   // snap.data!.snapshot.value.toString(),
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 20,
                  //     color: Colors.black,
                  //   ),
                  // ),
                  // Text(
                  //   snap.data!.snapshot.value[0]['name'].toString(),
                  //   // snap.data!.snapshot.value.toString(),
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 20,
                  //     color: Colors.black,
                  //   ),
                  // ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
