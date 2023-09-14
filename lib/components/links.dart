// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/design_system.dart';

class Links extends StatelessWidget {
  const Links({
    Key? key,
    required this.text,
    required this.iconPath,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 3,
          borderOnForeground: true,
          shadowColor: DSColors.placeHolderColor,
          surfaceTintColor: DSColors.secondary,
          // shape: RoundedRectangleBorder(
          //   side: BorderSide.none,
          //   borderRadius: BorderRadius.only(
          //     topRight: Radius.circular(30.0),
          //     bottomRight: Radius.circular(30.0),
          //   ),
          // ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: DSSizes.lg,
                      width: DSSizes.xl,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: DSColors.placeHolderColor,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          iconPath,
                          color: DSColors.primaryFontColor,
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: DSSizes.md,
                    ),
                    Text(
                      text,
                      style: DSType.subtitle1(
                          textColor: DSColors.primaryFontColor),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: DSSizes.md,
                  color: DSColors.primaryFontColor,
                ),
              ],
            ),
          ),
        ));
  }
}
