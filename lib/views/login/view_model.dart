import 'package:flutter/material.dart';

import '../../core/locator.dart';
import '../../core/share_data_view_model.dart';

class LoginViewModel extends ChangeNotifier {
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

  String? emailValidator({required BuildContext context, String? value}) {
    if (value!.isEmpty) {
      return 'please enter valid email address';
    }
    return null;
  }

  String? passwordValidator({required BuildContext context, String? value}) {
    if (value!.isEmpty) {
      return 'please enter valid email address';
    }
    return null;
  }

  Future<void> onTapLogin({
    required BuildContext context,
    required formKey,
    required email,
    required password,
  }) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }
}
