import 'package:flutter/material.dart';
import 'package:meal_sheal/core/locator.dart';
import 'package:meal_sheal/core/share_data_view_model.dart';

class PaymentDetailsViewModel extends ChangeNotifier {
  final SharedDataViewModel _sharedDataViewModel =
      locator<SharedDataViewModel>();
}