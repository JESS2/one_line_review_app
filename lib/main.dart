import 'package:flutter/material.dart';
import 'package:one_line_review_app/pages/tabs/home_page.dart';
import 'package:one_line_review_app/pages/tabs/my_movies_page.dart';
import 'package:one_line_review_app/pages/tabs/search_page.dart';
import 'package:one_line_review_app/pages/tabs/write_review_page.dart';
import 'package:one_line_review_app/pages/tabs/profile_page.dart';

// auth
//import 'package:one_line_review_app/pages/auth/sign_in.dart';
//import 'package:one_line_review_app/pages/auth/sign_up.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentTabIdx = 0;

  final List<Widget> _children = [
    HomePage(),
    MyMoviesPage(),
    WriteReviewPage(),
    ProfilePage()
  ];

  void _onTap(int idx) {
    setState(() {
      currentTabIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('한줄평'),
          ),
        ),
        body: _children[currentTabIdx],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black45,
          onTap: _onTap,
          currentIndex: currentTabIdx,
          items: [
            new BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
//            new BottomNavigationBarItem(
//              icon: Icon(Icons.search),
//              label: '검색',
//            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: '내 영화관',
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.create),
              label: '리뷰작성',
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '프로필',
            ),
          ],
        ),
      ),
    );
  }
}
