import 'package:flutter/material.dart';

import '../../core/locator.dart';
import '../../core/router.dart';
import '../../core/share_data_layer.dart';

class SplashViewModel extends ChangeNotifier {
  final SharedDataLayer _sharedDataLayer = locator<SharedDataLayer>();

  Future<void> startSplash({
    required BuildContext context,
  }) async {
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacementNamed(
        RoutePaths.login,
      );
    });
  }
}
