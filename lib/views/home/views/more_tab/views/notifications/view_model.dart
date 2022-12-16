import 'package:flutter/material.dart';
import 'package:meal_sheal/core/locator.dart';
import 'package:meal_sheal/core/share_data_view_model.dart';

class NotificationsViewModel extends ChangeNotifier {
  final SharedDataViewModel _sharedDataViewModel =
      locator<SharedDataViewModel>();
  List<String> get notificationMsgs {
    return _notificationMsgs;
  }

  final List<String> _notificationMsgs = [
    "Your Order has Been Picked Up",
    "Your Order has Been delivered",
    "Your Order has Been Picked Up",
    "Your Order has Been delivered",
    "Your Order has Been canceled",
    "On the Way",
    "Your Order has Been delivered",
    "Your Order has Been delivered",
    "Your Order has Been delivered",
    "Your Order has Been delivered",
    "Your Order has Been delivered",
    "Your Order has Been delivered",
    "Your Order has Been delivered",
    "Your Order has Been delivered",
    "Your Order has Been delivered",
    "Your Order has Been delivered",
    "Your Order has Been delivered",
  ];

}
