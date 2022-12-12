// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/design_system.dart';

class IconLink extends StatelessWidget {
  const IconLink({
    Key? key,
    required this.iconPath,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final String iconPath;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: DSColors.primary),
          borderRadius: BorderRadius.circular(DSSizes.sm),
        ),
        padding: const EdgeInsets.only(
          top: DSSizes.sm,
          right: DSSizes.md,
          bottom: DSSizes.sm,
          left: DSSizes.md,
        ),
        child: Row(
          children: <Widget>[
            SvgPicture.asset(
              iconPath,
              color: DSColors.primary,
              height: 40,
              width: 40,
            ),
            const SizedBox(width: DSSizes.md),
            Text(
              text,
              style: DSType.body2(textColor: DSColors.primaryDark),
            ),
          ],
        ),
      ),
    );
  }
}
