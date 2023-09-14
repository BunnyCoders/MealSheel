import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_sheal/components/button.dart';
import 'package:meal_sheal/components/custom_appbar.dart';
import 'package:meal_sheal/components/input_field.dart';
import 'package:meal_sheal/components/page_scaffold.dart';
import 'package:meal_sheal/core/design_system.dart';
import 'package:meal_sheal/views/home/views/more_tab/views/my_orders/views/checkout/view_model.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late CheckoutViewModel _viewModel;

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
                "You can remove this card at any time",
                style: DSType.subtitle2(textColor: DSColors.primaryFontColor),
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

  @override
  Widget _deliveryAddress() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          left: DSSizes.md,
          right: DSSizes.md,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivery Address",
              style: DSType.subtitle2(textColor: DSColors.placeHolderDark),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "653 Nostrad Ave.",
                      style: DSType.subtitle1(
                          textColor: DSColors.primaryFontColor),
                    ),
                    Text(
                      "Brooklyn, NY 11216",
                      style: DSType.subtitle1(
                          textColor: DSColors.primaryFontColor),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () =>
                      _viewModel.onTapChangeAddressButton(context: context),
                  child: Text(
                    "Change",
                    style: DSType.subtitle2(textColor: DSColors.primary),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _paymentMethods() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Payment Methods",
                  style: DSType.subtitle1(textColor: DSColors.placeHolderDark),
                ),
                InkWell(
                  onTap: () => _addCard(),
                  child: Text(
                    "+ Add Card",
                    style: DSType.subtitle2(textColor: DSColors.primary),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: DSSizes.md,
            ),
            _paymentMethodType(text: "Cash On Delivery"),
            const SizedBox(
              height: DSSizes.sm,
            ),
            _paymentMethodType(text: "VISA **** **** **** 1234"),
            const SizedBox(
              height: DSSizes.sm,
            ),
            _paymentMethodType(text: "UPI"),
            const SizedBox(
              height: DSSizes.md,
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentMethodType({required String text}) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 40,
          decoration: const BoxDecoration(
            color: DSColors.backgroundBodyGrey,
            shape: BoxShape.rectangle,
            border: Border(
              left: BorderSide(
                width: 0.5,
                color: DSColors.placeHolderLight,
              ),
              right: BorderSide(
                width: 0.5,
                color: DSColors.placeHolderLight,
              ),
              top: BorderSide(
                width: 0.5,
                color: DSColors.placeHolderLight,
              ),
              bottom: BorderSide(
                width: 0.5,
                color: DSColors.placeHolderLight,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: DSType.subtitle2(textColor: DSColors.primaryFontColor),
                ),
                const Icon(
                  Icons.circle_outlined,
                  size: 16,
                  color: DSColors.primary,
                )
              ],
            ),
          ),
        ),
      );

  Future<dynamic> _addCard() {
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: DSSizes.sm,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                child: const Icon(
                                  Icons.close,
                                  size: 25,
                                  color: DSColors.primaryFontColor,
                                )),
                          ],
                        ),
                      ),
                      const Divider(
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

  Future<dynamic> _orderPlaced() {
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: DSSizes.sm,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.close,
                                size: 25,
                                color: DSColors.primaryFontColor,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: DSSizes.sm,
                      ),
                      _orderPlacedThanksText()
                    ],
                  ),
                ),
              ),
            ));
  }

  Widget _subTotal() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "subtotal",
              style: DSType.subtitle1(textColor: DSColors.primaryFontColor),
            ),
            Text(
              "68",
              style: DSType.subtitle1(textColor: DSColors.primaryFontColor),
            ),
          ],
        ),
      );

  Widget _deliveryCost() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Delivery Cost",
              style: DSType.subtitle1(textColor: DSColors.primaryFontColor),
            ),
            Text(
              "02",
              style: DSType.subtitle1(textColor: DSColors.primaryFontColor),
            ),
          ],
        ),
      );

  Widget _total() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total",
              style: DSType.subtitle1(textColor: DSColors.primaryFontColor),
            ),
            Text(
              "66",
              style: DSType.subtitle1(textColor: DSColors.primaryFontColor),
            ),
          ],
        ),
      );

  Widget _discount() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Discount",
              style: DSType.subtitle1(textColor: DSColors.primaryFontColor),
            ),
            Text(
              "-4",
              style: DSType.subtitle1(textColor: DSColors.primaryFontColor),
            ),
          ],
        ),
      );

  Widget _sendOrderButton() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Button(
        background: DSColors.primary,
        onPressed: () => _orderPlaced(),
        text: "Send Order",
        textColor: DSColors.secondary,
      ),
    );
  }

  Widget _orderPlacedThanksText() {
    return Column(
      children: [
        Image.asset(
          "assets/images/thankyou.png",
          height: MediaQuery.of(context).size.height*0.40,
          width: MediaQuery.of(context).size.width,
        ),
        const SizedBox(
          height: DSSizes.md,
        ),
        Text(
          "Thank you!",
          style: DSType.subtitle2(textColor: DSColors.primaryFontColor),
        ),
        Text(
          "for your Order",
          style: DSType.subtitle2(textColor: DSColors.primaryFontColor),
        ),
        Text(
          "Your Order is now being placed.We will let you know once the order is placed from the outlet \n CHeck the status of your order",
          style: DSType.caption(textColor: DSColors.secondaryFontColor),
        ),
        const SizedBox(
          height: DSSizes.sm,
        ),
        Button(
          background: DSColors.primary,
          onPressed: () {},
          text: "Track your Order",
          textColor: DSColors.backgroundBodyLight,
        ),
        SizedBox(
          height: DSSizes.md,
        ),
        Button(
          background: DSColors.secondary,
          onPressed: () => _viewModel.onTapBackToHome(context: context),
          text: "Back To Home",
          textColor: DSColors.primary,
        )
      ],
    );
  }

  Widget _buildUI() {
    return Center(
      child: Column(
        children: [
          // const SizedBox(
          //   height: DSSizes.xs,
          // ),
          _deliveryAddress(),
          const Divider(
            thickness: 12,
          ),
          _paymentMethods(),
          const Divider(
            thickness: 12,
          ),
          _subTotal(),
          _deliveryCost(),
          _discount(),
          const Divider(
            thickness: 1,
          ),
          _total(),
          const Divider(
            thickness: 12,
          ),
          _sendOrderButton(),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    _viewModel = Provider.of<CheckoutViewModel>(context);
    return PageScaffold(
      appBar:
          CustomAppBar(context: context, text: "Checkout", isShowCart: false),
      children: [
        _buildUI(),
      ],
    );
  }
}
