// // ignore_for_file: prefer_const_constructors
// // ignore_for_file: prefer_const_literals_to_create_immutables

// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:meal_sheal/core/design_system.dart';
// import 'package:meal_sheal/views/home/views/home_tab/view.dart';
// import 'package:meal_sheal/views/home/views/menu_tab/view.dart';
// import 'package:meal_sheal/views/home/views/more_tab/view.dart';
// import 'package:meal_sheal/views/home/views/offers_tab/view.dart';
// import 'package:meal_sheal/views/home/views/profile_tab/view.dart';
// import 'package:provider/provider.dart';

// import '../../components/loading_indicator.dart';
// import '../../core/router.dart';
// import 'view_model.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView>
//     with SingleTickerProviderStateMixin {
//   late HomeViewModel _viewModel;

//   var _page = 0;

//   final _pages = [
//     HomeTabView(),
//     MenuTabView(),
//     ProfileTabView(),
//     OffersTabView(),
//     MoreTabView(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     _viewModel = Provider.of<HomeViewModel>(context);

//     return Scaffold(
//       body: _pages[_page],
//       bottomNavigationBar: CurvedNavigationBar(
//           animationCurve: Curves.linear,
//           backgroundColor: DSColors.placeHolderColor,
//           buttonBackgroundColor: DSColors.primary,
//           index: 0,
//           onTap: (index) {
//             setState(() {
//               _page = index;
//             });
//           },
//           items: [
//             Icon(Icons.home, size: 30, color: DSColors.linkDark,),
//             Icon(Icons.menu, size: 30, color: DSColors.linkDark,),
//             Icon(Icons.person, size: 30, color: DSColors.linkDark,),
//             Icon(Icons.local_offer, size: 30, color: DSColors.linkDark,),
//             Icon(Icons.more_horiz_rounded, size: 30, color: DSColors.linkDark,),
//           ]),
//     );
//   }
// }

import 'package:meal_sheal/components/tab_button.dart';
import 'package:meal_sheal/core/design_system.dart';
import 'package:meal_sheal/views/home/views/home_tab/view.dart';
import 'package:meal_sheal/views/home/views/menu_tab/view.dart';
import 'package:meal_sheal/views/home/views/more_tab/view.dart';
import 'package:meal_sheal/views/home/views/offers_tab/view.dart';
import 'package:meal_sheal/views/home/views/profile_tab/view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedTab = 2;
  PageStorageBucket storageBucket = PageStorageBucket();
  Widget selectPageView = const HomeTabView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: storageBucket,
        child: selectPageView,
      ),
      backgroundColor: DSColors.secondary,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            if (selectedTab != 2) {
              selectedTab = 2;
              selectPageView = const HomeTabView();
            }
            if (mounted) {
              setState(() {});
            }
          },
          shape: const CircleBorder(),
          backgroundColor:
              selectedTab == 2 ? DSColors.primary : DSColors.placeHolderColor,
          child: Image.asset(
            "assets/images/tab_home.png",
            width: 30,
            height: 30,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 4,
        notchMargin: 12,
        shape: const CircularNotchedRectangle(),
        child: SafeArea(
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TabButton(
                    title: "Menu",
                    icon: "assets/images/tab_menu.png",
                    onTap: () {
                      if (selectedTab != 0) {
                        selectedTab = 0;
                        selectPageView = const MenuTabView();
                      }
                      if (mounted) {
                        setState(() {});
                      }
                    },
                    isSelected: selectedTab == 0),
                TabButton(
                    title: "Offer",
                    icon: "assets/images/tab_offer.png",
                    onTap: () {
                      if (selectedTab != 1) {
                        selectedTab = 1;
                        selectPageView = const OffersTabView();
                      }
                      if (mounted) {
                        setState(() {});
                      }
                    },
                    isSelected: selectedTab == 1),
                const SizedBox(
                  width: 40,
                  height: 40,
                ),
                TabButton(
                    title: "Profile",
                    icon: "assets/images/tab_profile.png",
                    onTap: () {
                      if (selectedTab != 3) {
                        selectedTab = 3;
                        selectPageView = const ProfileTabView();
                      }
                      if (mounted) {
                        setState(() {});
                      }
                    },
                    isSelected: selectedTab == 3),
                TabButton(
                    title: "More",
                    icon: "assets/images/tab_more.png",
                    onTap: () {
                      if (selectedTab != 4) {
                        selectedTab = 4;
                        selectPageView = const MoreTabView();
                      }
                      if (mounted) {
                        setState(() {});
                      }
                    },
                    isSelected: selectedTab == 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
