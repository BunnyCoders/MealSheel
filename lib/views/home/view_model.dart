import 'package:flutter/material.dart';

import '../../core/locator.dart';
import '../../core/share_data_view_model.dart';

class HomeViewModel extends ChangeNotifier {
  final SharedDataViewModel _sharedDataViewModel =
      locator<SharedDataViewModel>();

   final bool _isLoading = false;

  final String _errorMessage = "";

  bool get isLoading {
    return _isLoading;
  }

  String get errorMessage {
    return _errorMessage;
  }

}