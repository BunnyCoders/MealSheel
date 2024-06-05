import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../core/locator.dart';
import '../../core/share_data_layer.dart';

class ChangePasswordViewModel extends ChangeNotifier {
  final SharedDataLayer _sharedDataLayer = locator<SharedDataLayer>();
}
