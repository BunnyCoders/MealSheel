import 'package:flutter/material.dart';
import 'package:meal_sheal/core/locator.dart';
import 'package:meal_sheal/core/router.dart';
import 'package:meal_sheal/core/share_data_view_model.dart';

class CheckoutViewModel extends ChangeNotifier {
  final SharedDataViewModel _sharedDataViewModel =
      locator<SharedDataViewModel>();

  void onTapSendOrderButton({required BuildContext context}) {
    // Navigator.of(context).pushNamed(
    //   RoutePaths.checkout,
    // );
  }

  void onTapChangeAddressButton({required BuildContext context}) {
    Navigator.of(context).pushNamed(
      RoutePaths.changeAddress,
    );
  }
  void onTapBackToHome({required BuildContext context}) {
    Navigator.of(context).pushNamed(
      RoutePaths.home,
    );
  }
}
