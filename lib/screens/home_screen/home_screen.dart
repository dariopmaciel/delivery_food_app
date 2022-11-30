import 'package:delivery_food_app/core/animations/slide_animation.dart';
import 'package:delivery_food_app/core/utils/utils.dart';
import 'package:delivery_food_app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:delivery_food_app/data.dart';
import 'package:delivery_food_app/screens/home_screen/widget/category_list_view.dart';
import 'package:delivery_food_app/screens/home_screen/widget/vendor_card.dart';
import 'package:flutter/material.dart';

import 'widget/clipped_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideAnimation(
        begin: Offset(0, 400),
        duration: const Duration(milliseconds: 750),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 750),
          padding: EdgeInsets.only(bottom: rh(20)),
          curve: Curves.fastLinearToSlowEaseIn,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const CustomAppBar(
                  hasBackButton: false,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: space2x),
                  child: RichText(
                    text: TextSpan(
                      text: "Olá, ",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: rf(24),
                            fontWeight: FontWeight.normal,
                          ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Dario",
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontSize: rf(24),
                                  ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: space2x),
                  child: Text(
                    "Entregar em Posto Morumbi",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: rf(12), height: 1.5),
                  ),
                ),
                SizedBox(height: rh(20)),
                ClippedContainer(
                  height: rh(120),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: const CategoryListView(),
                ),
                SizedBox(height: rh(space5x)),
                // ListView.separated(
                //   itemCount: vendorList.length,
                //   separatorBuilder: (BuildContext context, int index) {
                //     return Divider(
                //       height: rh(space4x),
                //       endIndent: rw(20),
                //       indent: rw(20),
                //     );
                //   },
                //   itemBuilder: (BuildContext context, int index) {
                //     return VendorCard(

                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
