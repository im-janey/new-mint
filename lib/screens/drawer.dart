import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/profile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                          builder: (context) => Profile()),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    alignment: Alignment.centerLeft,
                                  ),
                                  child: Text(
                                    '프로필 편집',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
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
    );
  }
}
