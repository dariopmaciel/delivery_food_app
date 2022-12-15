import 'package:delivery_food_app/core/animations/scale_animation.dart';
import 'package:delivery_food_app/core/utils/navigation.dart';
import 'package:delivery_food_app/core/utils/size_config.dart';
import 'package:delivery_food_app/core/utils/ui_helper.dart';
import 'package:delivery_food_app/core/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductionScreen extends StatefulWidget {
  const ProductionScreen({super.key});

  @override
  State<ProductionScreen> createState() => _ProductionScreenState();
}

class _ProductionScreenState extends State<ProductionScreen> {
  late double _height;
  final _duration = const Duration(milliseconds: 750);
  final _psudoDuration = const Duration(milliseconds: 150);

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
            children: [
              CustomAppBar(
                onBackTap: _navigateBack,
              ),
              SizedBox(
                height: 50 * SizeConfig.heightMultiplier,
                child: Stack(
                  children: [
                    Positioned.fill(
                      top: 0,
                      bottom: 0,
                      left: -180,
                      child: ScaleAnimation(
                        begin: 0,
                        duration: const Duration(milliseconds: 3000),
                        intervalStart: 0.2,
                        curve: Curves.easeOutBack,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            "assets/images/donut/donut_4.png",
                            width: rw(380),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
