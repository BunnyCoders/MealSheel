import 'package:flutter/material.dart';

import '../../../../core/locator.dart';
import '../../../../core/share_data_layer.dart';

class ProfileTabViewModel extends ChangeNotifier {
  final SharedDataLayer _sharedDataLayer = locator<SharedDataLayer>();

  Future<void> onTapSave({
    required BuildContext context,
    required formKey,
  }) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }
}
