import 'package:flutter/material.dart';

import '../core/design_system.dart';

class DropdownField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String?) onChanged;
  final String label;
  final String selectedOption;
  final List<String> options;

  const DropdownField({
    Key? key,
    required this.controller,
    this.label = '',
    required this.onChanged,
    required this.selectedOption,
    required this.options,
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
                    Text(
                      label,
                      style: DSType.subtitle1(
                        textColor: DSColors.bodyDark,
                      ),
                    ),
                    const SizedBox(height: DSSizes.sm),
                  ],
                ),
        ),
        FormField<String>(
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(
                  top: 14,
                  right: DSSizes.md,
                  bottom: 15,
                  left: DSSizes.md,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      DSSizes.xs,
                    ),
                  ),
                  borderSide: BorderSide(
                    width: 1,
                    color: DSColors.borderLight,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      DSSizes.xs,
                    ),
                  ),
                  borderSide: BorderSide(
                    width: 1,
                    color: DSColors.error,
                  ),
                ),
                filled: true,
                fillColor: DSColors.headingLight,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedOption,
                  isDense: true,
                  onChanged: onChanged,
                  items: options.map(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: DSType.body2(
                            textColor: DSColors.headingDark,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
