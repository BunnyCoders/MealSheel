import 'package:flutter/material.dart';

import '../../../../core/locator.dart';
import '../../../../core/router.dart';
import '../../../../core/share_data_view_model.dart';

class MoreTabViewModel extends ChangeNotifier {
  final SharedDataViewModel _sharedDataViewModel =
      locator<SharedDataViewModel>();

  void onTapAboutUs({required BuildContext context}) {
    Navigator.of(context).pushNamed(
      RoutePaths.aboutUs,
    );
  }

  void onTapInbox({required BuildContext context}) {
    Navigator.of(context).pushNamed(
      RoutePaths.inbox,
    );
  }

  void onTapNotification({required BuildContext context}) {
    Navigator.of(context).pushNamed(
      RoutePaths.notifications,
    );
  }

  void onTapMyOrder({required BuildContext context}) {
    Navigator.of(context).pushNamed(
      RoutePaths.myOrders,
    );
  }

  void onTapPaymentDetails({required BuildContext context}) {
    Navigator.of(context).pushNamed(
      RoutePaths.paymentDetails,
    );
  }
}
