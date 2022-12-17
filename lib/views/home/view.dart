// ignore_for_file: prefer_const_constructors

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
    this.selectedPage = 0,
  }) : super(key: key);

  final int selectedPage;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  late HomeViewModel _viewModel;
  late TabController _tabController;
  late ScrollController _scrollController;
  late int _selectedPage;

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
        _tabController = TabController(
      initialIndex: widget.selectedPage,
      length: 5,
      vsync: this,
    );

    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: _tabController,
      children: const <Widget>[
        HomeTabView(),
        MenuTabView(),
        OffersTabView(),
        ProfileTabView(),
        MoreTabView(),
      ],
    );
  }

  Widget _bottomNavigationBar() {
    Widget _tab({
      required String iconPath,
      required String text,
      required int tabIndex,
    }) {
      return Tab(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              iconPath,
              color: _tabController.index == tabIndex
                  ? DSColors.primary
                  : DSColors.placeHolderDark,
              height: 20,
              width: 20,
            ),
            const SizedBox(height: DSSizes.xs),
            Text(
              text,
              style: TextStyle(
                color: _tabController.index == tabIndex
                    ? DSColors.primary
                    : DSColors.placeHolderDark,
                fontFamily: 'Monopolish',
                fontSize: 12,
                fontWeight: FontWeight.w100,
                height: 1.5,
                letterSpacing: 0.25,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: DSColors.backgroundBodyGrey,
      ),
      padding: const EdgeInsets.only(
        top: DSSizes.sm,
      ),
      child: TabBar(
        controller: _tabController,
        indicatorColor: Colors.transparent,
        tabs: <Widget>[
          _tab(
            iconPath: 'assets/icons/menu.svg',
            text: 'Home',
            tabIndex: 0,
          ),
          _tab(
            iconPath: 'assets/icons/menu.svg',
            text: 'Menu',
            tabIndex: 1,
          ),
          _tab(
            iconPath: 'assets/icons/offers.svg',
            text: 'Offers',
            tabIndex: 2,
          ),
          _tab(
            iconPath: 'assets/icons/profile.svg',
            text: 'Profile',
            tabIndex: 3,
          ),
          _tab(
            iconPath: 'assets/icons/more.svg',
            text: 'More',
            tabIndex: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildUI() {
    return _viewModel.isLoading ? const LoadingIndicator() : _tabBarView();
  }


  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      body: _buildUI(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}
