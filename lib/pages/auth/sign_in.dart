import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:developer';

import 'package:one_line_review_app/pages/tabs/home_page.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseUser currentUser;
  String name = "";
  String email = "";
  String password = "";
  String url = "";

  Future<FirebaseUser> googleSingIn() async {
    final GoogleSignInAccount account = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await account.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    setState(() {
      email = user.email;
      url = user.photoUrl;
      name = user.displayName;
    });

    log('구글 로그인 성공');
    log(email);
    log(name);
    return user;
  }

  void googleSignOut() async {
    await _auth.signOut();
    await googleSignIn.signOut();

    setState(() {
      email = "";
      url = "";
      name = "";
    });

    print("User Sign Out");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              width: 100.0,
              height: 100.0,
              child: new Image.asset(
                'assets/logo3.png',
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 50.0, right: 50.0, top: 10.0, bottom: 10.0),
              child: emailField(),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 50.0, right: 50.0, top: 10.0, bottom: 20.0),
              child: passwordField(),
            ),
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 20.0),
              height: 50.0,
              width: double.infinity,
              child: submitButton(),
            ),
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 20.0),
              height: 50.0,
              width: double.infinity,
              child: signUpButton(),
            ),
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 20.0),
              height: 50.0,
              width: double.infinity,
              child: googleButton(),
            ),
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 20.0),
              height: 50.0,
              width: double.infinity,
              child: naverButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'you@exmaple.com',
      ),
      validator: validateEmail,
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      validator: validatePassword,
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('로그인',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) => RandomList(),
          // )).then((value) {
          //   setState(() {});
          // });
        }
      },
    );
  }

  Widget signUpButton() {
    return RaisedButton(
      color: Colors.orange,
      child: Text('회원가입',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
      onPressed: () {
        log('회원가입 클릭');
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => SignUp(),
        // )).then((value) {
        //   setState(() {});
        // });
      },
    );
  }

  Widget googleButton() {
    return RaisedButton(
      color: Colors.white,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: new Image.asset(
            'assets/google.png',
            height: 25.0,
            width: 25.0,
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: new Text(
              "Sign in with Google",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ))
      ]),
      onPressed: () {
        log('google sigin in 클릭');
        googleSingIn().then((FirebaseUser user){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomePage(),
          )).then((value) {
            setState(() {});
          });
        }).catchError((e) => print(e));
      },
    );
  }

  Widget naverButton() {
    return RaisedButton(
      color: Color(0xff1EC800),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: new Image.asset(
            'assets/naver.png',
            height: 25.0,
            width: 25.0,
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: new Text(
              "Sign in with NAVER",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ))
      ]),
      onPressed: () async {
        // 로그인 api
        String naverUrl = "http://127.0.0.1:3000/naverlogin";
        String _nToken = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => WebviewScaffold(
              url: naverUrl,
              javascriptChannels: Set.from([
                JavascriptChannel(
                    name: "james",
                    onMessageReceived: (JavascriptMessage result) async {
                      if (result.message != null)
                        return Navigator.of(context).pop(result.message);
                      return Navigator.of(context).pop();
                    }),
              ]),
            ),
          ),
        );
        if (_nToken != null) {
          return Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => SignIn()),
              (route) => false);
        }
      },
    );
  }

  Widget googleButton() {
    return RaisedButton(
      color: Colors.white,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: new Image.asset(
                'assets/google.png',
                height: 25.0,
                width: 25.0,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: new Text(
                  "Sign in with Google",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  ),
                )
            )
          ]
      ),
      onPressed: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => SignUp(),
        // )).then((value) {
        //   setState(() {});
        // });
      },
    );
  }

  Widget naverButton() {
    return RaisedButton(
      color: Color(0xff1EC800),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: new Image.asset(
              'assets/naver.png',
              height: 25.0,
              width: 25.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: new Text(
              "Sign in with NAVER",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
              ),
            )
          )
        ]
      ),
      onPressed: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => SignUp(),
        // )).then((value) {
        //   setState(() {});
        // });
      },
    );
  }
}

class ValidationMixin {
  String validateEmail(String value) {
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length < 6) {
      return 'Enter 6 more char';
    }
    return null;
  }
}
