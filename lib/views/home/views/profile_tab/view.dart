import 'package:flutter/material.dart';

import '../../../../components/appbar.dart';
import '../../../../components/custom_appbar.dart';
import '../../../../components/page_scaffold.dart';

class ProfileTabView extends StatefulWidget {
  const ProfileTabView({super.key});

  @override
  State<ProfileTabView> createState() => _ProfileTabViewState();
}

class _ProfileTabViewState extends State<ProfileTabView> {
  Widget _buildUI() {
    return Center(
      child: Column(
        children: <Widget>[Text("Profile Tab")],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      appBar: CustomAppBarWithOutBackButton(context: context, text: "Profile"),
      children: [_buildUI()],
    );
  }
}
