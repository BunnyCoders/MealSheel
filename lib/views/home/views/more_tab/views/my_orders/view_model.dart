import 'package:flutter/material.dart';
import 'package:meal_sheal/core/locator.dart';
import 'package:meal_sheal/core/router.dart';
import 'package:meal_sheal/core/share_data_layer.dart';

class MyOrdersViewModel extends ChangeNotifier {
  final SharedDataLayer _sharedDataLayer = locator<SharedDataLayer>();

  void onTapCheckOutButton({required BuildContext context}) {
    Navigator.of(context).pushNamed(
      RoutePaths.checkout,
    );
  }
}
