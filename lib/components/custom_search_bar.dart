// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meal_sheal/core/design_system.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            top: 10,
            right: DSSizes.md,
            bottom: 12,
            left: DSSizes.md,
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: DSColors.placeHolderDark,
          ),
          hintText: "Search Food",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                DSSizes.xxl,
              ),
            ),
            borderSide: BorderSide(
              width: 1,
              color: DSColors.borderDark,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                DSSizes.xxl,
              ),
            ),
            borderSide: BorderSide(
              width: 1,
              color: DSColors.borderDark,
            ),
          ),
          filled: true,
          fillColor: DSColors.backgroundBodyGrey,
        ),
      ),
    );
  }
}
