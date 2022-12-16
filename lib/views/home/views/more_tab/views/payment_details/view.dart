// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meal_sheal/components/appbar.dart';
import 'package:meal_sheal/components/button.dart';
import 'package:meal_sheal/components/custom_appbar.dart';
import 'package:meal_sheal/components/page_scaffold.dart';
import 'package:meal_sheal/core/design_system.dart';
import 'package:meal_sheal/core/router.dart';

class PaymentDetailsView extends StatefulWidget {
  const PaymentDetailsView({super.key});

  @override
  State<PaymentDetailsView> createState() => _PaymentDetailsViewState();
}

class _PaymentDetailsViewState extends State<PaymentDetailsView> {
  Widget _savedCard() {
    return Center(
      child: Container(
        height: 185,
        width: double.infinity,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle, color: DSColors.backgroundBodyDark),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Cash/Card on delivery",
                    style: DSType.subtitle1(textColor: DSColors.linkDark),
                  ),
                  Icon(
                    Icons.check,
                    size: 30,
                    color: DSColors.primary,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "VISA",
                    style: DSType.subtitle1(textColor: DSColors.linkDark),
                  ),
                  SizedBox(
                    width: DSSizes.md,
                  ),
                  Text(
                    "**** **** **** 2345",
                    style: DSType.subtitle1(textColor: DSColors.linkDark),
                  ),
                  SizedBox(
                    width: DSSizes.md,
                  ),
                  Expanded(
                      child: Button(
                    background: DSColors.headingLight,
                    onPressed: () {},
                    text: "Debit card",
                    textColor: DSColors.primary,
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Other Methods",
                style: DSType.subtitle1(textColor: DSColors.linkDark),
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
            padding: const EdgeInsets.only(left: 32.0, right: 16.0),
            child: Text(
              "Customized your payment method",
              style: DSType.h6(textColor: DSColors.linkDark),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          _savedCard(),
          const SizedBox(
            height: DSSizes.md,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Button(
              background: DSColors.primary,
              onPressed: () => _showBottomSheetForAddCard(),
              // () => Navigator.of(context).pushNamed(
              //   RoutePaths.addCard,
              // ),
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
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (context) => Column(
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
                ),
                Divider(
                  thickness: 1,
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      appBar: CustomAppBar(context: context, text: "Payment Details"),
      children: [_buildUI()],
    );
  }
}
