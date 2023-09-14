// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meal_sheal/components/button.dart';
import 'package:meal_sheal/core/design_system.dart';
import 'package:meal_sheal/views/home/views/menu_tab/view_model.dart';
import 'package:meal_sheal/views/home/views/offers_tab/view_model.dart';
import 'package:provider/provider.dart';

import '../../../../components/appbar.dart';
import '../../../../components/custom_appbar.dart';
import '../../../../components/page_scaffold.dart';

class OffersTabView extends StatefulWidget {
  const OffersTabView({super.key});

  @override
  State<OffersTabView> createState() => _OffersTabViewState();
}

class _OffersTabViewState extends State<OffersTabView> {
  late OffersTabViewModel _viewModel;

  Widget _findOfferText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Find discounts, Offers special\nmeals and more!",
            style: DSType.body1(
              textColor: DSColors.secondaryFontColor,
            ),
          ),
          const SizedBox(
            height: DSSizes.md,
          ),
          SizedBox(
            width: 140,
            height: 30,
            child: Button(
              isSmall: true,
              text: "check Offers",
              onPressed: () {},
              background: DSColors.primary,
              textColor: DSColors.secondary,
            ),
          ),
          const SizedBox(
            height: DSSizes.md,
          ),
        ],
      ),
    );
  }

  Widget _popularRestuantsPosts() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _viewModel.popularRestaurantsImagesPaths.length,
      itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: DSColors.placeHolderDark,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                          _viewModel.popularRestaurantsImagesPaths[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: DSSizes.sm,
              ),
              Text(
                _viewModel.popularRestaurantsNames[index],
                style: DSType.h6(textColor: DSColors.primaryFontColor),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: DSColors.primary,
                    size: 15,
                  ),
                  Text(
                    "4.9",
                    style: DSType.subtitle2(textColor: DSColors.primary),
                  ),
                  Text(
                    "(124 ratings) Cafe",
                    style:
                        DSType.subtitle2(textColor: DSColors.placeHolderDark),
                  ),
                  const SizedBox(
                    width: DSSizes.sm,
                  ),
                  Text(
                    "Western Food Cafe",
                    style:
                        DSType.subtitle2(textColor: DSColors.placeHolderDark),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _findOfferText(),
        _popularRestuantsPosts(),
        const SizedBox(
          width: DSSizes.lg,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<OffersTabViewModel>(context);
    return PageScaffold(
      appBar: CustomAppBarWithOutBackButton(
        context: context,
        text: "Latest Offers",
      ),
      children: [
        _buildUI(),
      ],
    );
  }
}
