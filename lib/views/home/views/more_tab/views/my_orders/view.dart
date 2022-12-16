import 'package:flutter/material.dart';
import 'package:meal_sheal/components/appbar.dart';
import 'package:meal_sheal/components/custom_appbar.dart';
import 'package:meal_sheal/components/page_scaffold.dart';


class MyOrdersView extends StatefulWidget {
  const MyOrdersView({super.key});

  @override
  State<MyOrdersView> createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView> {
  Widget _buildUI() {
    return  Center(
            child: Column(
              children: <Widget>[
                Text("My Orders")
              ],
            ),
          );
  }
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      appBar: CustomAppBar(context: context, text: "My Orders"),
      children: [
        _buildUI()
      ],
    );
  }
}