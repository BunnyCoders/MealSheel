import 'package:flutter/material.dart';

import '../../../../components/appbar.dart';
import '../../../../components/custom_appbar.dart';
import '../../../../components/page_scaffold.dart';

class OffersTabView extends StatefulWidget {
  const OffersTabView({super.key});

  @override
  State<OffersTabView> createState() => _OffersTabViewState();
}

class _OffersTabViewState extends State<OffersTabView> {
  Widget _buildUI() {
    return  Center(
            child: Column(
              children: <Widget>[
                Text("Offers Tab")
              ],
            ),
          );
  }
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      appBar: CustomAppBarWithOutBackButton(context: context, text: "Offers"),
      children: [
        _buildUI()
      ],
    );
  }
}