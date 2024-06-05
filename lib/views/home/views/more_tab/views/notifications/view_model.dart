import 'package:flutter/material.dart';
import 'package:meal_sheal/core/locator.dart';
import 'package:meal_sheal/core/share_data_layer.dart';

class NotificationsViewModel extends ChangeNotifier {
  final SharedDataLayer _sharedDataLayer = locator<SharedDataLayer>();
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
