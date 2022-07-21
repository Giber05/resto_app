import 'dart:async';
import 'package:flutter/material.dart';
import 'package:resto_app/core/utils/constants.dart';
import 'package:resto_app/modules/authenticated/presentation/features/restaurant_list/restaurant_list_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash-screen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(
            context, RestaurantListScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFFF4B3A),
        body: ListView(
          children: [
            Container(
                padding: EdgeInsets.only(
                  left: 32,
                  right: 32,
                  bottom: 32,
                  top: 48,
                ),
                alignment: Alignment.topLeft,
                child: Image.asset("assets/images/splash/logo.png")),
            Padding(
              padding: EdgeInsets.only(
                left: 32,
                right: 32,
                bottom: 32,
              ),
              child: Text(
                "Food for Everyone",
                style: TextStyle(
                  fontSize: 64,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Image.asset(AssetConstant.image + "splash/splash_image.png"),
          ],
        ));
  }
}
