import 'package:flutter/material.dart';

import '../../core/locator.dart';
import '../../core/share_data_layer.dart';

class HomeViewModel extends ChangeNotifier {
  final SharedDataLayer _sharedDataLayer = locator<SharedDataLayer>();

  final bool _isLoading = false;

  final String _errorMessage = "";

  bool get isLoading {
    return _isLoading;
  }

  String get errorMessage {
    return _errorMessage;
  }
}
