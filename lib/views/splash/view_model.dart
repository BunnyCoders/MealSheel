import 'package:flutter/material.dart';

import '../../core/locator.dart';
import '../../core/router.dart';
import '../../core/share_data_view_model.dart';

class SplashViewModel extends ChangeNotifier {
  final SharedDataViewModel _sharedDataViewModel =
      locator<SharedDataViewModel>();

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
