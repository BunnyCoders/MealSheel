import 'package:flutter/material.dart';

import '../../../../components/appbar.dart';
import '../../../../components/custom_appbar.dart';
import '../../../../components/page_scaffold.dart';

class MoreTabView extends StatefulWidget {
  const MoreTabView({super.key});

  @override
  State<MoreTabView> createState() => _MoreTabViewState();
}

class _MoreTabViewState extends State<MoreTabView> {
  Widget _buildUI() {
    return  Center(
            child: Column(
              children: <Widget>[
                Text("More Tab")
              ],
            ),
          );
  }
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      appBar: CustomAppBarWithOutBackButton(context: context, text: "More"),
      children: [
        _buildUI()
      ],
    );
  }
}