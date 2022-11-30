import 'dart:async';

import 'package:delivery_food_app/core/animations/animations.dart';
import 'package:delivery_food_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _next();
    super.initState();
  }

  _next() {
    Timer(const Duration(milliseconds: 450), () {
      Navigation.push(
        context,
        customPageTransition: PageTransition(
          child: const HomeScreen(),
          type: PageTransitionType.fadeIn,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(),
    );
  }
}
