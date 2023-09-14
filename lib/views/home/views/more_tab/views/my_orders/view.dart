// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meal_sheal/components/appbar.dart';
import 'package:meal_sheal/components/button.dart';
import 'package:meal_sheal/components/custom_appbar.dart';
import 'package:meal_sheal/components/page_scaffold.dart';
import 'package:meal_sheal/core/design_system.dart';
import 'package:meal_sheal/views/home/views/more_tab/views/my_orders/view_model.dart';
import 'package:provider/provider.dart';

class MyOrdersView extends StatefulWidget {
  const MyOrdersView({super.key});

  @override
  State<MyOrdersView> createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView> {
  late MyOrdersViewModel _viewModel;
  Widget _ordersTopArea() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: DSColors.secondary,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            spreadRadius: 5,
            blurRadius: 0.5,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(12),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/burger.jpeg",
                  height: 100,
                  width: 100,
                ),
              ),
              // const SizedBox(
              //   width: DSSizes.xs,
              // ),
              Padding(
                padding: EdgeInsets.only(
                  left: 12,
                  right: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "King Burgers",
                      style: DSType.h6(
                        textColor: DSColors.primaryFontColor,
                      ),
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                          color: DSColors.primary,
                        ),
                        Text(
                          "4.9",
                          style: DSType.subtitle2(
                            textColor: DSColors.primary,
                          ),
                        ),
                        Text(
                          "(124 ratings)",
                          style: DSType.subtitle2(
                            textColor: DSColors.secondaryFontColor,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Burger , Western Food",
                      style: DSType.subtitle2(
                        textColor: DSColors.placeHolderDark,
                      ),
                    ),
                    Text(
                      "No. 03, 4th Lane, New York",
                      style: DSType.subtitle2(
                        textColor: DSColors.placeHolderDark,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _orderMiddleArea() => Container(
        decoration: BoxDecoration(color: DSColors.backgroundBodyDark),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _foodNames(foodName: "Beef Burger x1", price: "16"),
              Divider(
                thickness: 1,
              ),
              _foodNames(foodName: "Classic Burger x1", price: "14"),
              Divider(
                thickness: 1,
              ),
              _foodNames(foodName: "Cheese Chicken Burger x1", price: "15"),
              Divider(
                thickness: 1,
              ),
              _foodNames(foodName: "Cheese Chicken Leg Burger x1", price: "17"),
              Divider(
                thickness: 1,
              ),
              _foodNames(foodName: "French Fries Large x1", price: "6"),
            ],
          ),
        ),
      );

  Widget _foodNames({
    required String foodName,
    required String price,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            foodName,
            style: DSType.subtitle2(textColor: DSColors.secondaryFontColor),
          ),
          Text(
            price,
            style: DSType.subtitle2(textColor: DSColors.secondaryFontColor),
          )
        ],
      );

  Widget _deliveryInstructions() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Delivery Instructions",
              style: DSType.subtitle1(textColor: DSColors.primaryFontColor),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "+ Add Notes",
                style: DSType.subtitle2(textColor: DSColors.primary),
              ),
            )
          ],
        ),
      );
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
              style: DSType.subtitle1(textColor: DSColors.primary),
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
              style: DSType.subtitle1(textColor: DSColors.primary),
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
              "70",
              style: DSType.h6(textColor: DSColors.primary),
            ),
          ],
        ),
      );

  Widget _checkoutButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Button(
        background: DSColors.primary,
        onPressed: () => _viewModel.onTapCheckOutButton(context: context),
        text: "Checkout",
        textColor: DSColors.secondary,
      ),
    );
  }

  Widget _buildUI() {
    return Center(
      child: Column(
        children: <Widget>[
          _ordersTopArea(),

          _orderMiddleArea(),
          _deliveryInstructions(),
          Divider(
            thickness: 1,
          ),
          _subTotal(),
          _deliveryCost(),
          Divider(
            thickness: 1,
          ),
          _total(),
          // Divider(thickness: 1,),
          const SizedBox(
            height: DSSizes.md,
          ),
          _checkoutButton(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<MyOrdersViewModel>(context);
    return PageScaffold(
      appBar: CustomAppBar(
        context: context,
        text: "My Orders",
        // isShowCart: true,
      ),
      children: [
        _buildUI(),
      ],
    );
  }
}
