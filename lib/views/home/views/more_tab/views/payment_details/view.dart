// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_sheal/components/appbar.dart';
import 'package:meal_sheal/components/button.dart';
import 'package:meal_sheal/components/custom_appbar.dart';
import 'package:meal_sheal/components/page_scaffold.dart';
import 'package:meal_sheal/core/design_system.dart';
import 'package:meal_sheal/core/router.dart';
import 'package:meal_sheal/views/home/views/more_tab/views/payment_details/view_model.dart';
import 'package:provider/provider.dart';

import '../../../../../../components/input_field.dart';

class PaymentDetailsView extends StatefulWidget {
  const PaymentDetailsView({super.key});

  @override
  State<PaymentDetailsView> createState() => _PaymentDetailsViewState();
}

class _PaymentDetailsViewState extends State<PaymentDetailsView> {
  late PaymentDetailsViewModel _viewModel;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _cardNumberTextFieldController;
  late TextEditingController _firstNameTextFieldController;
  late TextEditingController _lastNameTextFieldController;
  late TextEditingController _securityCodeTextFieldController;
  late TextEditingController _expiryYearTextFieldController;
  late TextEditingController _expiryMonthTextFieldController;

  @override
  void initState() {
    super.initState();
    _cardNumberTextFieldController = TextEditingController();
    _firstNameTextFieldController = TextEditingController();
    _lastNameTextFieldController = TextEditingController();
    _securityCodeTextFieldController = TextEditingController();
    _expiryYearTextFieldController = TextEditingController();
    _expiryMonthTextFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _cardNumberTextFieldController.dispose;
    _firstNameTextFieldController.dispose;
    _lastNameTextFieldController.dispose;
    _securityCodeTextFieldController.dispose;
    _expiryYearTextFieldController.dispose;
    _expiryMonthTextFieldController.dispose;
    super.dispose();
  }

  Widget _inputFeild() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputField(
            controller: _cardNumberTextFieldController,
            placeholder: "Card Number",
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (String? value) {},
          ),
          const SizedBox(
            height: DSSizes.md,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Expiry",
                  style: DSType.subtitle2(textColor: DSColors.primaryFontColor),
                ),
              ),
              const SizedBox(
                height: DSSizes.md,
              ),
              Expanded(
                flex: 2,
                child: InputField(
                    controller: _expiryMonthTextFieldController,
                    placeholder: "MM",
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (String? value) {}),
              ),
              const SizedBox(
                height: DSSizes.md,
              ),
              Expanded(
                flex: 2,
                child: InputField(
                    controller: _expiryYearTextFieldController,
                    placeholder: "YY",
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (String? value) {}),
              ),
            ],
          ),
          const SizedBox(
            height: DSSizes.md,
          ),
          InputField(
            controller: _securityCodeTextFieldController,
            placeholder: "Security code",
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (String? value) {},
          ),
          const SizedBox(
            height: DSSizes.md,
          ),
          InputField(
            controller: _firstNameTextFieldController,
            placeholder: "First Name",
            inputFormatters: const [],
            validator: (String? value) {},
          ),
          const SizedBox(
            height: DSSizes.md,
          ),
          InputField(
            controller: _lastNameTextFieldController,
            placeholder: "Last Name",
            inputFormatters: const [],
            validator: (String? value) {},
          ),
          const SizedBox(
            height: DSSizes.md,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "you can remove this card \n at any time",
                style: DSType.subtitle2(textColor: DSColors.secondaryFontColor),
              ),
              CupertinoSwitch(
                value: true,
                onChanged: (bool value) {},
                activeColor: DSColors.primary,
                trackColor: DSColors.backgroundBodyGrey,
              )
            ],
          ),
          const SizedBox(
            height: DSSizes.sm,
          ),
          Padding(
            padding: const EdgeInsets.all(42.0),
            child: Button(
              background: DSColors.primary,
              onPressed: () {},
              text: "+ ADD CARD",
              textColor: DSColors.backgroundBodyLight,
            ),
          )
        ],
      ),
    );
  }

  Widget _savedCard() {
    return Center(
      child: Container(
        height: 185,
        width: double.infinity,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: DSColors.backgroundBodyDark,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 20.0,
                  offset: Offset(0.0, 5.0)),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(DSSizes.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Cash/Card on delivery",
                    style:
                        DSType.subtitle1(textColor: DSColors.primaryFontColor),
                  ),
                  Icon(
                    Icons.check,
                    size: 30,
                    color: DSColors.primary,
                  )
                ],
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(DSSizes.sm),
                child: Container(
                  height: DSSizes.xl,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Text(
                        "VISA",
                        style: DSType.subtitle1(
                            textColor: DSColors.primaryFontColor),
                      ),
                      SizedBox(
                        width: DSSizes.md,
                      ),
                      Text(
                        "**** **** **** 2345",
                        style: DSType.subtitle1(
                            textColor: DSColors.primaryFontColor),
                      ),
                      SizedBox(
                        width: DSSizes.md,
                      ),
                      Expanded(
                          child: Button(
                        isSmall: true,
                        background: DSColors.secondary,
                        onPressed: () {},
                        text: "Debit card",
                        textColor: DSColors.primary,
                      ))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Other Methods",
                style: DSType.subtitle1(textColor: DSColors.primaryFontColor),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUI() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: DSSizes.md,
          ),
          Padding(
            padding: const EdgeInsets.all(
              DSSizes.md,
            ),
            child: Text(
              "Customized your payment method",
              style: DSType.h6(textColor: DSColors.primaryFontColor),
            ),
          ),
          const Divider(
            thickness: 1,
            indent: 25,
            endIndent: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(
              DSSizes.md,
            ),
            child: _savedCard(),
          ),
          const SizedBox(
            height: DSSizes.md,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Button(
              background: DSColors.primary,
              onPressed: () => _showBottomSheetForAddCard(),
              text: "+ ADD another debit/credit card",
              textColor: DSColors.backgroundBodyLight,
            ),
          ),
          const SizedBox(
            height: DSSizes.md,
          ),
        ],
      ),
    );
  }

  Future<dynamic> _showBottomSheetForAddCard() {
    return showModalBottomSheet(
        elevation: 10,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        context: context,
        builder: (context) => DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.8,
              maxChildSize: 0.8,
              minChildSize: 0.28,
              builder: (context, scrollController) => SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(DSSizes.sm),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: DSSizes.sm,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(DSSizes.sm),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Add credit/debit card",
                              style: DSType.subtitle1(
                                  textColor: DSColors.primaryFontColor),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.close,
                                  size: DSSizes.md,
                                  color: DSColors.primaryFontColor,
                                )),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: DSSizes.md,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _inputFeild(),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<PaymentDetailsViewModel>(context);

    return PageScaffold(
      appBar: CustomAppBar(
          context: context, text: "Payment Details", isShowCart: true),
      children: [_buildUI()],
    );
  }
}
