import 'package:flutter/material.dart';

class HashTagButton extends StatelessWidget {
  final String tagName;
  HashTagButton({@required this.tagName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Text(
          tagName,
          style: TextStyle(
            color: Color(0xff666666),
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
        ),
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(right: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(68.0),
          border: Border.all(color: Color(0xFF666666)),
          color: Colors.white,
        ),
      ),
    );
  }
}
