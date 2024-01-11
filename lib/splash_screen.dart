import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'people.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => people(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Container(
        width: 414.sp,
        height: 896.sp,
        child: Stack(
          children: [
            Positioned(
              top: 200.sp,
              left: 100.sp,
              child: Container(
                width: 170.sp,
                height: 170.sp,
                child: Image(
                  image: AssetImage(
                    "assets/star_wars_logo_1.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 38.sp,
              left: 120.sp,
              child: Padding(
                padding: EdgeInsets.all(1.sp),
                child: Container(
                  width: 128.sp,
                  height: 35.sp,
                  child: Image(
                    image: AssetImage(
                      "assets/thinkit-logo.png",
                    ),
                    fit: BoxFit.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
