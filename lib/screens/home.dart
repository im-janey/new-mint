import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/all.dart';
import 'package:flutter_application_1/screens/banner1.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/map/cafe.dart';
import 'package:flutter_application_1/screens/map/display.dart';
import 'package:flutter_application_1/screens/map/food.dart';
import 'package:flutter_application_1/screens/map/park.dart';
import 'package:flutter_application_1/screens/map/play.dart';

import 'profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isSearchFocused = false;
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(() {
      setState(() {
        _isSearchFocused = _searchFocusNode.hasFocus;
      });
    });
  }

  Widget _buildIconButton(String asset, Widget destination) {
    return TextButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destination),
      ),
      child: Image.asset(asset, height: 55, width: 50),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 110,
            title: Image.asset('assets/logo.png', width: 175, height: 100),
            actions: [
              Stack(
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                      icon: Icon(Icons.menu, size: 30),
                      padding: EdgeInsets.only(top: 21, right: 28),
                    ),
                  ),
                  Positioned(
                    right: 26,
                    top: 19,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          endDrawer: Drawer(
            child: Container(
              color: Colors.white,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: 260,
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 25),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          SizedBox(height: 8),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '건우',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Profile()),
                                          );
                                        },
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          alignment: Alignment.centerLeft,
                                        ),
                                        child: Text(
                                          '프로필 편집',
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage('assets/profile_image.png'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Column(
                          children: [
                            Icon(Icons.work_outline),
                            Text('내 코스'),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.favorite_outline),
                            Text('찜한 장소'),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.map_outlined),
                            Text('지도'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person_2_outlined),
                    title: Text('나의 리뷰'),
                    onTap: () {
                      // Handle My Page tap
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on_outlined),
                    title: Text('최근 본 장소'),
                    onTap: () {
                      // Handle Settings tap
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings_outlined),
                    title: Text('환경설정'),
                    onTap: () {
                      // Handle Settings tap
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    color: Colors.white,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LogIn()),
                          );
                        },
                        child: Text(
                          '  로그아웃',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    color: Colors.white,
                    child: Image.asset('assets/Group 317.png'),
                  ),
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              SizedBox(height: 15),
              Banner1(),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    TextField(
                      focusNode: _searchFocusNode,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        hintText: '어디로 갈까요?',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: _isSearchFocused ? 2.0 : 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1.0,
                          ),
                        ),
                        filled: true,
                        fillColor: _isSearchFocused
                            ? Color(0xFF17BABE).withOpacity(0.1)
                            : Colors.grey[100],
                        prefixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                    SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            _buildIconButton('assets/bob.png', Frame()),
                            SizedBox(height: 18),
                            _buildIconButton(
                                'assets/display.png', DisplayFrame()),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 22),
                          child: Column(
                            children: [
                              _buildIconButton('assets/cafe.png', CafeFrame()),
                              SizedBox(height: 18),
                              _buildIconButton('assets/play.png', PlayFrame()),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            _buildIconButton('assets/park.png', ParkFrame()),
                            SizedBox(height: 18),
                            _buildIconButton(
                                'assets/all.png', AllPlacesFrame()),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
