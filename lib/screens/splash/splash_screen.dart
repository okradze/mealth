import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'splash';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => SplashScreen(),
    );
  }

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 2),
      () => Navigator.of(context).pushReplacementNamed(HomeScreen.routeName),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo1.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
