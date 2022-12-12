import 'package:flutter/material.dart';
import 'package:meal_sheal/components/custom_appbar.dart';
import 'package:meal_sheal/components/page_scaffold.dart';

import '../../../../components/appbar.dart';

class MenuTabView extends StatefulWidget {
  const MenuTabView({super.key});

  @override
  State<MenuTabView> createState() => _MenuTabViewState();
}

class _MenuTabViewState extends State<MenuTabView> {
  Widget _buildUI() {
    return  Center(
            child: Column(
              children: <Widget>[
                Text("Menu Tab")
              ],
            ),
          );
  }
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      appBar: CustomAppBarWithOutBackButton(context: context, text: "Menu"),
      children: [
        _buildUI()
      ],
    );
  }
}
