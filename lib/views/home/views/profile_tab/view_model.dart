import 'package:flutter/material.dart';

import '../../../../core/locator.dart';
import '../../../../core/share_data_view_model.dart';

class ProfileTabViewModel extends ChangeNotifier {
  final SharedDataViewModel _sharedDataViewModel =
      locator<SharedDataViewModel>();

  Future<void> onTapSave({
    required BuildContext context,
    required formKey,
  }) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }
}
