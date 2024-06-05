import 'package:flutter/material.dart';

import '../../core/locator.dart';
import '../../core/share_data_layer.dart';

class OnboardingViewModel extends ChangeNotifier {
  final SharedDataLayer _sharedDataLayer = locator<SharedDataLayer>();
}
