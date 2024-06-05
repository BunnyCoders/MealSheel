import 'package:flutter/material.dart';
import 'package:meal_sheal/core/locator.dart';
import 'package:meal_sheal/core/router.dart';
import 'package:meal_sheal/core/share_data_layer.dart';

class CheckoutViewModel extends ChangeNotifier {
  final SharedDataLayer _sharedDataLayer = locator<SharedDataLayer>();

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
