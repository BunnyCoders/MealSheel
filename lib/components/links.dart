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
      child: Container(
        height: DSSizes.xl,
        decoration: const BoxDecoration(color: DSColors.backgroundBodyGrey),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: DSColors.placeHolderDark,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          iconPath,
                          color: DSColors.linkDark,
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
                      style: DSType.subtitle1(textColor: DSColors.linkDark),
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 15,
                  backgroundColor: DSColors.placeHolderDark,
                  child: Center(
                      child: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: DSColors.linkDark,
                  )),
                )
              ],
            )),
      ),
    );
  }
}
