import 'package:flutter/material.dart';
import 'package:meal_sheal/core/locator.dart';
import 'package:meal_sheal/core/share_data_view_model.dart';

class InboxViewModel extends ChangeNotifier {
  final SharedDataViewModel _sharedDataViewModel =
      locator<SharedDataViewModel>();

  List<String> get inboxMsgs {
    return _inboxMsgs;
  }

  final List<String> _inboxMsgs = [
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
