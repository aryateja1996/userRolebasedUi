import 'dart:async';
import 'package:employee/exports.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => AllUser(),
            ),
            (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        //child: Text('Click To Call'),
        child: Image(
          image: NetworkImage(
            'https://firebasestorage.googleapis.com/v0/b/capstone-295608.appspot.com/o/logo%2Fcap_logo_magentaC.png?alt=media&token=0c50c9d7-6a87-45c6-81ce-93721512c6e3',
          ),
          width: 250,
          height: 250,
        ),
      ),
    );
  }
}
