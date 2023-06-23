// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_sheal/core/design_system.dart';
import 'package:meal_sheal/views/home/views/home_tab/view.dart';
import 'package:meal_sheal/views/home/views/menu_tab/view.dart';
import 'package:meal_sheal/views/home/views/more_tab/view.dart';
import 'package:meal_sheal/views/home/views/offers_tab/view.dart';
import 'package:meal_sheal/views/home/views/profile_tab/view.dart';
import 'package:provider/provider.dart';

import '../../components/loading_indicator.dart';
import '../../core/router.dart';
import 'view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late HomeViewModel _viewModel;

  var _page = 0;

  final _pages = [
    HomeTabView(),
    MenuTabView(),
    ProfileTabView(),
    OffersTabView(),
    MoreTabView(),
  ];

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      body: _pages[_page],
      bottomNavigationBar: CurvedNavigationBar(
          animationCurve: Curves.linear,
          backgroundColor: DSColors.backgroundBodyLight,
          index: 0,
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          items: [
            Icon(Icons.home, size: 30),
            Icon(Icons.menu, size: 30),
            Icon(Icons.person, size: 30),
            Icon(Icons.local_offer, size: 30),
            Icon(Icons.more_horiz_rounded, size: 30),
          ]),
    );
  }
}
