import 'package:flutter/material.dart';

class PageScaffold extends StatelessWidget {
  final PreferredSize appBar;
  final List<Widget> children;
  final GlobalKey? scaffoldKey;

  const PageScaffold({
    Key? key,
    required this.appBar,
    required this.children,
    this.scaffoldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: children,
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
