import 'package:flutter/material.dart';
import 'package:one_line_review_app/pages/auth/sign_in.dart';

class ProfilePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 20.0),
      height: 50.0,
      width: double.infinity,
      child: signUpButton(),
    );
  }

  Widget signUpButton() {
    return RaisedButton(
      color: Colors.grey,
      child: Text('로그인',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SignIn(),
        )).then((value) {
          setState(() {});
        });
      },
    );
  }
}
