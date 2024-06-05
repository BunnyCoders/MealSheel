// ignore_for_file: unnecessary_getters_setters, use_build_context_synchronously, prefer_const_constructors

import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meal_sheal/components/button.dart';
import 'package:meal_sheal/core/design_system.dart';
import 'package:meal_sheal/core/locator.dart';
import 'package:meal_sheal/core/router.dart';
import 'package:meal_sheal/core/services/api_service.dart';

final SharedDataLayer _sharedDataLayer = locator<SharedDataLayer>();

class SharedDataLayer {
  String status = "Waiting...";
  final ApiService apiService = locator<ApiService>();

  void exitProcedure({required BuildContext context}) {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');

    Future.delayed(const Duration(milliseconds: 100), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
        RoutePaths.splash,
        (Route<dynamic> route) => false,
      );
    });
  }

  showComingSoonDialog({required BuildContext context}) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: IntrinsicHeight(
          child: Column(
            children: <Widget>[
              Image(
                width: DSSizes.xl,
                height: DSSizes.xl,
                image: const AssetImage(
                  'assets/images/logo.png',
                ),
              ),
              SizedBox(height: DSSizes.sm),
              Text(
                'common_text.coming_soon_dialog_text'.tr(),
                style: DSType.subtitle1(
                  textColor: DSColors.headingDark,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              right: DSSizes.md,
              bottom: DSSizes.md,
              left: DSSizes.md,
            ),
            child: Button(
              background: DSColors.primary,
              text: 'common_text.ok'.tr(),
              onPressed: () => Navigator.pop(context, 'OK'),
            ),
          ),
        ],
      ),
    );
  }

  showServiceUnavailableDialog({required BuildContext context}) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: IntrinsicHeight(
          child: Column(
            children: <Widget>[
              Image(
                width: DSSizes.xl,
                height: DSSizes.xl,
                image: const AssetImage(
                  'assets/images/logo.png',
                ),
              ),
              SizedBox(height: DSSizes.sm),
              Text(
                'common_text.service_unavailable_dialog_text'.tr(),
                style: DSType.subtitle1(
                  textColor: DSColors.headingDark,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              right: DSSizes.md,
              bottom: DSSizes.md,
              left: DSSizes.md,
            ),
            child: Button(
              background: DSColors.primary,
              text: 'common_text.ok'.tr(),
              onPressed: () => Navigator.pop(context, 'OK'),
            ),
          ),
        ],
      ),
    );
  }

  showCommonOkDialog({
    required BuildContext context,
    required String message,
    bool isUseDoubleBackOnTapOk = false,
  }) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: IntrinsicHeight(
          child: Column(
            children: <Widget>[
              Text(
                message,
                style: DSType.h6(
                  textColor: DSColors.headingDark,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              bottom: DSSizes.sm,
              left: DSSizes.md,
              right: DSSizes.md,
            ),
            child: Button(
              background: DSColors.primary,
              text: 'common_text.ok'.tr(),
              onPressed: () => onTapOk(context: context),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onPressedContactIconShared({
    required TextEditingController phoneTextFieldController,
  }) async {
    PhoneContact contact = await FlutterContactPicker.pickPhoneContact();

    String? phoneNumber = contact.phoneNumber!.number;

    phoneNumber = phoneNumber!.replaceAll(RegExp(r"^\+91"), '');
    phoneNumber = phoneNumber.replaceAll(RegExp(r"^\+223"), '');
    phoneNumber = phoneNumber.replaceAll(RegExp(r"^\+225"), '');
    phoneNumber = phoneNumber.replaceAll(RegExp(r"^\+226"), '');
    phoneNumber = phoneNumber.replaceAll(RegExp(r"^\+227"), '');
    phoneNumber = phoneNumber.replaceAll(RegExp(r"^\+228"), '');
    phoneNumber = phoneNumber.replaceAll(RegExp(" "), '');
    phoneNumber = phoneNumber.replaceAll(RegExp("-"), '');

    phoneTextFieldController.text = phoneNumber;
  }

  void onTapOk({required BuildContext context}) {
    Navigator.pop(context);
  }

  void showToastMessage(String message) {
  Fluttertoast.showToast(
      msg: message, //message to show toast
      toastLength: Toast.LENGTH_LONG, //duration for message to show
      gravity: ToastGravity.BOTTOM_LEFT, //where you want to show, top, bottom
      timeInSecForIosWeb: 1, //for iOS only
      backgroundColor: DSColors.placeHolderDark, //background Color for message
      textColor: DSColors.bodyDark, //message text color
      fontSize: DSSizes.md //message font size
      );
}
}
