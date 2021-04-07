import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screens/LoginPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));

    return MaterialApp(
      title: 'Buymax',
      theme: new ThemeData(
        backgroundColor: Colors.white,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => directToNext(),
    );
  }

  void directToNext() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeOne()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: new Center(
          child: new Text(
            'BUYMAX',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                color: HexColor("#FC4B4B"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        scaffoldBackgroundColor: HexColor("#1D1E32"),
        accentColor: HexColor("#FC4B4B"),
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


