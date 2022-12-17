// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meal_sheal/components/appbar.dart';
import 'package:meal_sheal/components/custom_search_bar.dart';
import 'package:meal_sheal/components/page_scaffold.dart';
import 'package:meal_sheal/components/popular_text_link.dart';
import 'package:meal_sheal/core/design_system.dart';
import 'package:meal_sheal/views/home/views/home_tab/view_model.dart';
import 'package:provider/provider.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  late HomeTabViewModel _viewModel;
  @override
  Widget _userLocation() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Delivering to",
            style: DSType.subtitle1(
              textColor: DSColors.placeHolderLight,
            ),
          ),
          Row(
            children: [
              Text(
                "Current Location",
                style: DSType.subtitle1(
                  textColor: DSColors.primary,
                ),
              ),
              Icon(
                Icons.arrow_downward_sharp,
                size: DSSizes.md,
                color: DSColors.primary,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _searchBar() {
    return CustomSearchBar();
  }

  Widget _categories() {
    return Container(
      height: 100,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: _viewModel.imagesPaths.length,
          itemBuilder: ((context, index) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(DSSizes.sm),
                    ),
                    boxShadow: DSShadows.buttonCard,
                  ),
                  child: Center(
                    child: Image.asset(
                      _viewModel.imagesPaths[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: DSSizes.sm,
                ),
                Text(
                  _viewModel.catNames[index],
                  style: DSType.subtitle2(textColor: DSColors.linkDark),
                )
              ],
            );
          })),
    );
  }

  Widget _popularRestaurants() {
    return PopularTextHeadingLink(
      text: "Popular Restaurants",
      onPressed: () {},
    );
  }

  Widget _mostPopular() {
    return PopularTextHeadingLink(
      text: "Most Popular",
      onPressed: () {},
    );
  }

  Widget _recentItems() {
    return PopularTextHeadingLink(
      text: "Recent Items",
      onPressed: () {},
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
                style: DSType.h6(textColor: DSColors.linkDark),
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

  Widget _recentItemsPost() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _viewModel.popularRestaurantsImagesPaths.length,
      itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 100,
                      width: 100,
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
                    width: DSSizes.md,
                  ),
                  Column(
                    children: [
                      Text(
                        _viewModel.popularRestaurantsNames[index],
                        style: DSType.h6(textColor: DSColors.linkDark),
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
                            style:
                                DSType.subtitle2(textColor: DSColors.primary),
                          ),
                          Text(
                            "(124 ratings) Cafe",
                            style: DSType.subtitle2(
                                textColor: DSColors.placeHolderDark),
                          ),
                        ],
                      ),
                      Text(
                        "Western Food Cafe",
                        style: DSType.subtitle2(
                            textColor: DSColors.placeHolderDark),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _mostPopularRestuantsPosts() {
    return Container(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        // physics: NeverScrollableScrollPhysics(),
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
                    height: 120,
                    width: 240,
                    decoration: BoxDecoration(
                      // color: DSColors.primary,
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
                  style: DSType.h6(textColor: DSColors.linkDark),
                ),
                Row(
                  children: [
                    Text(
                      " Cafe",
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
      ),
    );
  }

  Widget _buildUI() {
    return Center(
      child: Column(
        children: [
          _userLocation(),
          _searchBar(),
          _categories(),
          _popularRestaurants(),
          _popularRestuantsPosts(),
          _mostPopular(),
          _mostPopularRestuantsPosts(),
          _recentItems(),
          _recentItemsPost()
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    _viewModel = Provider.of<HomeTabViewModel>(context);
    return PageScaffold(
      appBar:
          CustomAppBarWithOutBackButton(context: context, text: "Hello John!"),
      children: [_buildUI()],
    );
  }
}
