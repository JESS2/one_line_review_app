import 'package:flutter/material.dart';
import 'package:one_line_review_app/network/api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var diorList = HttpHelper.getBrandProduct('dior');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('home'),
    );
  }
}
