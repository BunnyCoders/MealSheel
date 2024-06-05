// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_sheal/components/custom_appbar.dart';
import 'package:meal_sheal/components/custom_search_bar.dart';
import 'package:meal_sheal/components/page_scaffold.dart';
import 'package:meal_sheal/core/design_system.dart';
import 'package:meal_sheal/views/home/views/menu_tab/view_model.dart';
import 'package:provider/provider.dart';

import '../../../../components/appbar.dart';
import '../home_tab/view_model.dart';

class MenuTabView extends StatefulWidget {
  const MenuTabView({super.key});

  @override
  State<MenuTabView> createState() => _MenuTabViewState();
}

class _MenuTabViewState extends State<MenuTabView> {
  late MenuTabViewModel _viewModel;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _viewModel.init(context: context);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _searchBar() {
    return CustomSearchBar();
  }

  Widget _menuLinks() {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.27,
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
            color: DSColors.primary,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(35),
                bottomRight: Radius.circular(35)),
          ),
        ),
        ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 8, right: 20),
                    width: MediaQuery.of(context).size.width - 100,
                    height: 90,
                    decoration: const BoxDecoration(
                        color: DSColors.secondary,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 7,
                              offset: Offset(0, 4))
                        ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/menu_3.png",
                        width: 80,
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Food",
                              style: DSType.h6(
                                textColor: DSColors.primaryFontColor,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "112 items",
                              style: DSType.subtitle2(
                                textColor: DSColors.primaryFontColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: DSColors.secondary,
                          borderRadius: BorderRadius.circular(17.5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4,
                                offset: Offset(0, 2))
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _productsList() {
    return _viewModel.products.data != null
        ? ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _viewModel.products.data!.length,
            itemBuilder: ((context, index) {
              var _product = _viewModel.products.data![index];
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
                                image: NetworkImage(_product.image.toString()),
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
                              _product.name.toString(),
                              style: DSType.h6(
                                  textColor: DSColors.primaryFontColor),
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
                                  style: DSType.subtitle2(
                                      textColor: DSColors.primary),
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
          )
        : Container(
            child: Text(
              "No data found",
              style: DSType.subtitle2(textColor: DSColors.error),
            ),
          );
  }

  Widget _categoriesList() {
    return _viewModel.categories.data != null
        ? ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _viewModel.categories.data!.length,
            itemBuilder: ((context, index) {
              var _category = _viewModel.categories.data![index];
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
                                image: NetworkImage(_category.image.toString()),
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
                              _category.name.toString(),
                              style: DSType.h6(
                                  textColor: DSColors.primaryFontColor),
                            ),
                            // Row(
                            //   children: [
                            //     Icon(
                            //       Icons.star,
                            //       color: DSColors.primary,
                            //       size: 15,
                            //     ),
                            //     Text(
                            //       "4.9",
                            //       style: DSType.subtitle2(
                            //           textColor: DSColors.primary),
                            //     ),
                            //     Text(
                            //       "(124 ratings) Cafe",
                            //       style: DSType.subtitle2(
                            //           textColor: DSColors.placeHolderDark),
                            //     ),
                            //   ],
                            // ),
                            // Text(
                            //   "Western Food Cafe",
                            //   style: DSType.subtitle2(
                            //       textColor: DSColors.placeHolderDark),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          )
        : Container(
            child: Text(
              "No data found",
              style: DSType.subtitle2(textColor: DSColors.error),
            ),
          );
  }

  Widget _buildUI() {
    return _viewModel.isLoading
        ? Center(child: _getLoadingUI())
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _searchBar(),
              _menuLinks(),
              // _productsList(),
              // _categoriesList()
            ],
          );
  }

  Widget _getLoadingUI() {
    return Center(
      child: SpinKitFadingCircle(
        size: DSSizes.xl,
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? Colors.red : Colors.green,
            ),
            child: Text(
              "Loading..",
              style: DSType.subtitle2(textColor: DSColors.bodyDark),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<MenuTabViewModel>(context);
    return PageScaffold(
      appBar: CustomAppBarWithOutBackButton(
        context: context,
        text: "Menu",
      ),
      children: [
        _buildUI(),
      ],
    );
  }
}
