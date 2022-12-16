// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../core/design_system.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.background = Colors.transparent,
    this.borderColor = DSColors.primary,
    this.isSmall = false,
    required this.onPressed,
    required this.text,
    this.textColor = DSColors.headingLight,
  }) : super(key: key);

  final bool isSmall;
  final String text;
  final Color background;
  final Color borderColor;
  final Function onPressed;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: isSmall ? 28 : 48,
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(background),
            padding: MaterialStateProperty.all(
              EdgeInsets.only(
                top: isSmall ? 0 : DSSizes.md,
                right: isSmall ? DSSizes.md : 24,
                bottom: isSmall ? 0 : DSSizes.md,
                left: isSmall ? DSSizes.md : 24,
              ),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(DSSizes.xxxl),
                side: BorderSide(color: borderColor, width: 1),
              ),
            ),
          ),
          onPressed: () => onPressed(),
          child: Text(
            text.toUpperCase(),
            style: isSmall
                ? DSType.buttonSmall(
                    textColor: textColor,
                  )
                : DSType.button(
                    textColor: textColor,
                  ),
          ),
        ));
  }
}
