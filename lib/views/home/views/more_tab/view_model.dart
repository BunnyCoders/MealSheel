import 'package:flutter/material.dart';

import '../../../../core/locator.dart';
import '../../../../core/share_data_view_model.dart';

class MoreTabViewModel extends ChangeNotifier {
  final SharedDataViewModel _sharedDataViewModel =
      locator<SharedDataViewModel>();
}