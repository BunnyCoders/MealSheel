import 'package:flutter/material.dart';
import 'package:meal_sheal/core/locator.dart';
import 'package:meal_sheal/core/router.dart';
import 'package:meal_sheal/core/share_data_view_model.dart';

class MyOrdersViewModel extends ChangeNotifier {
  final SharedDataViewModel _sharedDataViewModel =
      locator<SharedDataViewModel>();

  void onTapCheckOutButton({required BuildContext context}) {
    Navigator.of(context).pushNamed(
      RoutePaths.checkout,
    );
  }
}
