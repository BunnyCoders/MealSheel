import 'package:flutter/material.dart';
import 'package:meal_sheal/core/design_system.dart';

class PopularTextHeadingLink extends StatelessWidget {
  const PopularTextHeadingLink({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: DSType.h6(
                  textColor: DSColors.primaryFontColor,
                ),
              ),
              TextButton(
                onPressed: () => onPressed,
                child: Text(
                  "See All",
                  style: DSType.subtitle1(
                    textColor: DSColors.primary,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
