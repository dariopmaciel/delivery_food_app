import 'dart:async';

import 'package:delivery_food_app/core/animations/animations.dart';
import 'package:delivery_food_app/core/utils/ui_helper.dart';
import 'package:delivery_food_app/core/utils/utils.dart';
import 'package:delivery_food_app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:delivery_food_app/data.dart';
import 'package:delivery_food_app/screens/home_screen/widget/clipped_container.dart';
import 'package:delivery_food_app/screens/product_screen/production_screen.dart';
import 'package:delivery_food_app/screens/vendor_screen/widgets/product_item_card.dart.dart';
import 'package:delivery_food_app/screens/vendor_screen/widgets/vendor_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class VendorScreen extends StatefulWidget {
  const VendorScreen({super.key});

  @override
  State<VendorScreen> createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {
  late double _height;
  final _duration = const Duration(milliseconds: 750);
  final _psudoDuration = const Duration(milliseconds: 150);

  _navigate() async {
    _animateContainerFromBottomToTop();
    //disponibiliza os produtos na tela
    //espera até que o produto esteja ativo
    await Navigation.push(
      context,
      customPageTransition: PageTransition(
        child: const ProductionScreen(),
        type: PageTransitionType.fadeIn,
      ),
    );
    await _animateContainerFromTopToBottom();
  }

  _navigateBack() async {
    _animateContainerFromBottomToTop();
    Navigation.pop(context);
  }

  _animateContainerFromBottomToTop() async {
    //Animate back to defauld value
    _height = MediaQuery.of(context).padding.top + rh(50);
    setState(() {});
    //wait till animatian is finished
    await Future.delayed(_duration);
  }

  _animateContainerFromTopToBottom() async {
    //await
    await Future.delayed(_psudoDuration);

    //animate from top to bottom
    _height = MediaQuery.of(context).size.height;
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _height = MediaQuery.of(context).padding.top + rh(50);
    setState(() {});
    //Default height

    //Animate Container from Top to bottom
    _animateContainerFromTopToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        height: _height,
        duration: _duration,
        padding: EdgeInsets.only(bottom: rh(20)),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: rh(300),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      height: rf(250),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          "assets/images/temp_vendor_bg.png",
                          width: 100 * SizeConfig.heightMultiplier,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      child: CustomAppBar(
                        onBackTap: _navigateBack,
                      ),
                    ),
                    const Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: ClippedContainer(
                        backgroundColor: Colors.white,
                        child: VendorInfoCard(
                          title: "New York Donut",
                          rating: 4.2,
                          sideImagePath: 'assets/images/temp_vendor_logo.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: rh(space2x)),
              FadeAnimation(
                intervalStart: 0.4,
                duration: const Duration(milliseconds: 1250),
                child: SlideAnimation(
                  begin: const Offset(0, 100),
                  intervalStart: 0.4,
                  duration: const Duration(milliseconds: 1500),
                  child: ListView.separated(
                    //este item trava a listview e foi a melhor coisa que me apareceu
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: productList.length,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        height: rh(space4x),
                        endIndent: rw(20),
                        indent: rw(20),
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: _navigate,
                        child: ProductItem(
                          imagePath: productList[index]["imagePath"],
                          title: productList[index]['title'],
                          detail: productList[index]['detail'],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
