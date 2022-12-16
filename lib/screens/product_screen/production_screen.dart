import 'package:delivery_food_app/core/animations/fade_animation.dart';
import 'package:delivery_food_app/core/animations/scale_animation.dart';
import 'package:delivery_food_app/core/animations/slide_animation.dart';
import 'package:delivery_food_app/core/utils/navigation.dart';
import 'package:delivery_food_app/core/utils/size_config.dart';
import 'package:delivery_food_app/core/utils/ui_helper.dart';
import 'package:delivery_food_app/core/widgets/custom_widgets.dart';
import 'package:delivery_food_app/screens/product_screen/widget/product_info_text.dart';
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
                            width: rw(600),
                          ),
                        ),
                      ),
                    ),
                    //INFORMAÇÃO DO PRODUTO
                    Positioned.fill(
                      top: rh(40),
                      bottom: 0,
                      right: rw(space2x),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: FadeAnimation(
                          duration: const Duration(milliseconds: 1250),
                          child: ScaleAnimation(
                            intervalStart: 0.4,
                            duration: const Duration(milliseconds: 1250),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const <Widget>[
                                ProductInfoText(
                                  text: "Peso",
                                  value: "250g",
                                ),
                                ProductInfoText(
                                  text: "Calorias",
                                  value: "567 Cal",
                                ),
                                ProductInfoText(
                                  text: "Porção",
                                  value: "1 Pessoa",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FadeAnimation(
                  intervalStart: 0.4,
                  duration: const Duration(milliseconds: 3000),
                  child: SlideAnimation(
                    intervalStart: 0.4,
                    begin: const Offset(0, 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Donut de Framboesa",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        SizedBox(height: rf(space1x)),
                        Text(
                          "R\$ 12,50",
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    color: Theme.of(context).primaryColorDark,
                                    fontSize: rf(28),
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        SizedBox(height: rf(space1x)),
                        Text(
                          "Descritivo do incrivel sabor presente neste donut. Descritivo do incrivel sabor presente neste donut. Descritivo do incrivel sabor presente neste donut. Descritivo do incrivel sabor presente neste donut.",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: space2x,
                  vertical: space1x,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.transparent,
                      ),
                      child: Buttons.icon(
                        context: context,
                        icon: Icons.favorite_border,
                        size: 28,
                        iconColor: Theme.of(context).primaryColorDark,
                        top: space2x,
                        left: space2x,
                        right: space2x,
                        bottom: space2x,
                        semanticLabel: "Favorito",
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(width: rw(space1x)),
                    Expanded(
                      child: Buttons.flexible(
                        vPadding: 20,
                        borderRadius: 100,
                        context: context,
                        text: "Carrinho de Compras",
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
