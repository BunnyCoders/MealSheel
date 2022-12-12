import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/design_system.dart';

class InputField extends StatelessWidget {
  final bool autoFocus;
  final TextEditingController controller;
  final bool enabled;
  final bool isLabelCenter;
  final bool isBold;
  final List<TextInputFormatter> inputFormatters;
  final bool isPassword;
  final bool isKeyboardTypeNumber;
  final bool isTextCenter;
  final String? Function(String)? onChanged;
  final String? Function(String)? onSubmitted;
  final String label;
  final String placeholder;
  final String? Function(String?) validator;

  const InputField({
    Key? key,
    this.autoFocus = false,
    required this.controller,
    this.enabled = true,
    this.isLabelCenter = false,
    this.isBold = false,
    required this.inputFormatters,
    this.isPassword = false,
    this.isKeyboardTypeNumber = false,
    this.isTextCenter = false,
    this.label = '',
    this.placeholder = '',
    required this.validator,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: label == ''
              ? null
              : Column(
                  children: <Widget>[
                    isLabelCenter == true
                        ? Center(
                            child: Text(
                              label,
                              style: DSType.subtitle1(
                                textColor: DSColors.bodyDark,
                              ),
                            ),
                          )
                        : Text(
                            label,
                            style: DSType.subtitle1(
                              textColor: DSColors.bodyDark,
                            ),
                          ),
                    const SizedBox(height: DSSizes.sm),
                  ],
                ),
        ),
        TextFormField(
          autofocus: autoFocus,
          controller: controller,
          cursorColor: DSColors.headingDark,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              top: 14,
              right: DSSizes.md,
              bottom: 15,
              left: DSSizes.md,
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  DSSizes.xxl,
                ),
              ),
              borderSide: BorderSide(
                width: 1,
                color: DSColors.borderDark,
              ),
            ),
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  DSSizes.xxl,
                ),
              ),
              borderSide: BorderSide(
                width: 1,
                color: DSColors.borderDark,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  DSSizes.xxl,
                ),
              ),
              borderSide: BorderSide(
                width: 1,
                color: DSColors.error,
              ),
            ),
            filled: true,
            fillColor:
                enabled ? DSColors.headingLight : DSColors.backgroundBodyGrey,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  DSSizes.xxl,
                ),
              ),
              borderSide: BorderSide(
                color: DSColors.primary,
                width: 1,
              ),
            ),
            isCollapsed: true,
            hintText: placeholder,
            hintStyle: DSType.body2(
              textColor: DSColors.placeHolderDark,
            ),
          ),
          enabled: enabled,
          keyboardType:
              isKeyboardTypeNumber ? TextInputType.number : TextInputType.text,
          obscureText: isPassword,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          style: isBold
              ? DSType.h6(textColor: DSColors.headingDark)
              : DSType.body2(textColor: DSColors.headingDark),
          textAlign: isTextCenter ? TextAlign.center : TextAlign.left,
          validator: validator,
        ),
        // ),
      ],
    );
  }
}
