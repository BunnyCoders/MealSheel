// ignore_for_file: unnecessary_getters_setters, unused_field, avoid_print, prefer_const_constructors,

import 'dart:async';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../components/button.dart';
import 'design_system.dart';
import 'locator.dart';

// this viewModel is used as a mechanism to share data between multiple viewModels, it stores all the shared data between viewModels at the same place
// it do not extends changeNotifier class because then it will not be accessible inside other viewModels
class SharedDataViewModel {
  // final ApiService apiService = locator<ApiService>();

  // DatabaseHelper handler = DatabaseHelper();

  // User _user = User(
  //   phoneNumber: '22899990507',
  // );

  bool _isLoggedIn = false;

  // User get user {
  //   return _user;
  // }

  // set user(User user) {
  //   _user = user;
  // }

  set isLoggedIn(bool value) {
    _isLoggedIn = value;
  }

  bool get isLoggedIn {
    return _isLoggedIn;
  }

  onInternetNotAvailable({required BuildContext context, String? message}) {
    void onTapCancel() {
      exit(0);
    }

    return showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: WillPopScope(
          onWillPop: () async => false,
          child: IntrinsicHeight(
            child: Column(
              children: <Widget>[
                const Image(
                  width: DSSizes.xl,
                  height: DSSizes.xl,
                  image: AssetImage(
                    'assets/images/logo.png',
                  ),
                ),
                const SizedBox(height: DSSizes.sm),
                Text(
                  message!,
                  style: DSType.h6(
                    textColor: DSColors.headingDark,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              bottom: DSSizes.md,
              left: DSSizes.md,
              right: DSSizes.md,
            ),
            child: Button(
              background: DSColors.primary,
              // iconPath: 'assets/icons/arrow_right_alt.svg',
              text: 'common_text.exit'.tr(),
              textColor: DSColors.headingLight,
              onPressed: () => onTapCancel(),
            ),
          ),
        ],
      ),
    );
  }

  bool activeConnection = false;
  Future<void> checkUserConnection({required BuildContext context}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        activeConnection = true;
        print("common_text.user_connected_with_internet".tr());
      }
    } on SocketException catch (_) {
      activeConnection = false;
      onInternetNotAvailable(
          context: context, message: 'common_text.internet_not_found'.tr());
    }
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

  // confirmTransactionDialog({
  //   required String apiTrigger,
  //   required BuildContext context,
  //   required String dialogText,
  //   required ProcessingData processingData,
  //   String amount = '',
  //   String recipientNumber = '',
  // }) {
  //   void _onTapConfirm({required BuildContext context}) {
  //     Navigator.of(context).pushNamed(
  //       RoutePaths.password,
  //       arguments: PasswordArgument(
  //         apiTrigger: apiTrigger,
  //         label: 'labels.enter_your_pin_code_to_continue'.tr(),
  //         processingData: processingData,
  //       ),
  //     );
  //   }

  //   void _onTapCancel({required BuildContext context}) {
  //     Navigator.pop(context);
  //   }

  //   return showDialog<String>(
  //     context: context,
  //     builder: (BuildContext context) => AlertDialog(
  //       content: IntrinsicHeight(
  //         child: Column(
  //           children: <Widget>[
  //             const Image(
  //               width: DSSizes.xl,
  //               height: DSSizes.xl,
  //               image: AssetImage(
  //                 'assets/images/logo.png',
  //               ),
  //             ),
  //             const SizedBox(height: DSSizes.sm),
  //             Text(
  //               dialogText,
  //               style: DSType.subtitle1(
  //                 textColor: DSColors.headingDark,
  //               ),
  //               textAlign: TextAlign.center,
  //             ),
  //             const SizedBox(height: DSSizes.sm),
  //             recipientNumber != ''
  //                 ? Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Expanded(
  //                         child: Text(
  //                           "${'common_text.recipient_number'.tr()}: ",
  //                           style: DSType.subtitle1(
  //                             textColor: DSColors.placeHolderDark,
  //                           ),
  //                         ),
  //                       ),
  //                       Expanded(
  //                         child: Text(
  //                           recipientNumber,
  //                           style: DSType.subtitle1(
  //                             textColor: DSColors.headingDark,
  //                           ),
  //                           textAlign: TextAlign.right,
  //                         ),
  //                       ),
  //                     ],
  //                   )
  //                 : Container(),
  //             amount != ''
  //                 ? Column(
  //                     children: <Widget>[
  //                       const SizedBox(height: DSSizes.sm),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Expanded(
  //                             child: Text(
  //                               '${'common_text.amount'.tr()}: ',
  //                               style: DSType.subtitle1(
  //                                 textColor: DSColors.placeHolderDark,
  //                               ),
  //                             ),
  //                           ),
  //                           Expanded(
  //                             child: Text(
  //                               amount,
  //                               style: DSType.subtitle1(
  //                                 textColor: DSColors.headingDark,
  //                               ),
  //                               textAlign: TextAlign.right,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   )
  //                 : Container(),
  //           ],
  //         ),
  //       ),
  //       actions: <Widget>[
  //         Padding(
  //           padding: const EdgeInsets.only(
  //             bottom: DSSizes.sm,
  //             left: DSSizes.md,
  //             right: DSSizes.md,
  //           ),
  //           child: Button(
  //             background: DSColors.primary,
  //             text: 'common_text.confirm'.tr(),
  //             onPressed: () => _onTapConfirm(context: context),
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(
  //             bottom: DSSizes.md,
  //             left: DSSizes.md,
  //             right: DSSizes.md,
  //           ),
  //           child: Button(
  //             background: DSColors.placeHolderDark,
  //             text: 'common_text.cancel'.tr(),
  //             textColor: DSColors.headingDark,
  //             onPressed: () => _onTapCancel(context: context),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  

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
                image: AssetImage(
                  'assets/images/logo.png',
                ),
              ),
              const SizedBox(height: DSSizes.sm),
              Text(
                'common_text.coming_soon'.tr(),
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
              text: "common_text.ok".tr(),
              onPressed: () => Navigator.pop(context, 'OK'),
            ),
          ),
        ],
      ),
    );
  }

  // confirmLoginDetailsDialog({
  //   required BuildContext context,
  // }) {
  //   void _onTapOk() {
  //     Navigator.pop(context);
  //   }

  //   void _onTapPartialPayment({
  //     required BuildContext context,
  //     required TextEditingController controller,
  //     required String? Function(String?) validator,
  //   }) {
  //     Navigator.pop(context);
  //     showDialog<String>(
  //       context: context,
  //       builder: (BuildContext context) => AlertDialog(
  //         content: IntrinsicHeight(
  //           child: Column(
  //             children: <Widget>[
  //               InputField(
  //                 controller: controller,
  //                 inputFormatters: [
  //                   FilteringTextInputFormatter.digitsOnly,
  //                 ],
  //                 label: 'labels.enter_pdv_flooz_number'.tr(),
  //                 placeholder: 'placeholders.flooz_number'.tr(),
  //                 isKeyboardTypeNumber: true,
  //                 validator: validator,
  //               )
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           Padding(
  //             padding: const EdgeInsets.only(
  //               bottom: DSSizes.sm,
  //               left: DSSizes.md,
  //               right: DSSizes.md,
  //             ),
  //             child: Button(
  //                 background: DSColors.primary,
  //                 text: "common_text.continue".tr(),
  //                 onPressed: () async {}),
  //           ),
  //         ],
  //       ),
  //     );
  //   }

  //   return showDialog<String>(
  //     context: context,
  //     builder: (BuildContext context) => AlertDialog(
  //       content: IntrinsicHeight(
  //         child: Column(
  //           children: <Widget>[
  //             const Image(
  //               width: DSSizes.xl,
  //               height: DSSizes.xl,
  //               image: AssetImage(
  //                 'assets/images/logo.png',
  //               ),
  //             ),
  //             const SizedBox(height: DSSizes.sm),
  //             Text(
  //               "labels.enter_mobile_number".tr(),
  //               style: DSType.subtitle1(
  //                 textColor: DSColors.headingDark,
  //               ),
  //               textAlign: TextAlign.center,
  //             ),
  //             const SizedBox(height: DSSizes.sm),
  //           ],
  //         ),
  //       ),
  //       actions: <Widget>[],
  //     ),
  //   );
  // }

  void showToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message, //message to show toast
        toastLength: Toast.LENGTH_LONG, //duration for message to show
        gravity: ToastGravity.BOTTOM_LEFT, //where you want to show, top, bottom
        timeInSecForIosWeb: 1, //for iOS only
        backgroundColor:
            DSColors.placeHolderDark, //background Color for message
        textColor: DSColors.bodyDark, //message text color
        fontSize: DSSizes.md //message font size
        );
  }
}
