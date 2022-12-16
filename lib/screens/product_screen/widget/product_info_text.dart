import 'package:delivery_food_app/core/utils/utils.dart';
import 'package:flutter/material.dart';

class ProductInfoText extends StatelessWidget {
  const ProductInfoText({super.key, required this.text, required this.value});

  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style:
              Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: rf(12)),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: rf(16),
                height: 1.5,
              ),
        ),
        SizedBox(
          height: rf(space5x),
        )
      ],
    );
  }
}
