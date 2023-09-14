// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/design_system.dart';

// ignore: non_constant_identifier_names
PreferredSize CustomAppBar({
  required BuildContext context,
  String iconPath = 'assets/icons/arrow_left.svg',
  required String text,
  bool isShowCart = false,
  String buttonText = 'Edit',
  String buttonIconPath = 'assets/icons/edit.svg',
  Color buttonColor = DSColors.headingLight,
  Color buttonTextColor = DSColors.headingDark,
}) {
  void _onTapBack() {
    Navigator.pop(context);
  }

  return PreferredSize(
    preferredSize: const Size.fromHeight(DSSizes.xl),
    child: Container(
      decoration: const BoxDecoration(
        color: DSColors.secondary,
      ),
      padding: const EdgeInsets.only(
        bottom: DSSizes.md,
        // left: DSSizes.sm,
        right: DSSizes.sm,
        top: 50,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: DSSizes.sm),
              Center(
                child: IconButton(
                  onPressed: _onTapBack,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: DSColors.primaryFontColor,
                    size: 20,
                  ),
                ),
              ),
              Text(
                text,
                style: DSType.h6(
                  textColor: DSColors.primaryFontColor,
                ),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ],
          ),
          const SizedBox(width: DSSizes.md),
          isShowCart
              ? IconButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, RoutePaths.home);
                  },
                  icon: const Icon(
                    Icons.shopping_basket,
                    color: DSColors.headingDark,
                    size: DSSizes.lg,
                  ))
              : Container()
        ],
      ),
    ),
  );
}
