// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meal_sheal/components/input_field.dart';
import 'package:meal_sheal/core/design_system.dart';

import '../../../../../../../components/appbar.dart';
import '../../../../../../../components/page_scaffold.dart';

class AddCardView extends StatefulWidget {
  const AddCardView({super.key});

  @override
  State<AddCardView> createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _addressTextFieldController;
  late TextEditingController _nameTextFieldController;
  late TextEditingController _emailTextFieldController;
  late TextEditingController _phoneNumberTextFieldController;
  late TextEditingController _passwordTextFieldController;
  late TextEditingController _confirmPasswordTextFieldController;

  @override
  void initState() {
    super.initState();
    _addressTextFieldController = TextEditingController();
    _nameTextFieldController = TextEditingController();
    _emailTextFieldController = TextEditingController();
    _phoneNumberTextFieldController = TextEditingController();
    _passwordTextFieldController = TextEditingController();
    _confirmPasswordTextFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _addressTextFieldController.dispose;
    _nameTextFieldController.dispose;
    _emailTextFieldController.dispose;
    _phoneNumberTextFieldController.dispose;
    _passwordTextFieldController.dispose;
    _confirmPasswordTextFieldController.dispose;
    super.dispose();
  }

  Widget _inputFeild() {
    return Form(
      child: Column(
        children: [
          InputField(
              controller: _emailTextFieldController,
              inputFormatters: [],
              validator: (String? value) {})
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: DSSizes.lg),
              Container(
                 height: 160,
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  color: DSColors.backgroundBodyGrey,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Wrap(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add credit/debit card",
                          style: DSType.subtitle1(textColor: DSColors.linkDark),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              size: 25,
                              color: DSColors.linkDark,
                            ))
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
