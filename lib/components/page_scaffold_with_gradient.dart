import 'package:flutter/material.dart';

import '../core/design_system.dart';

class PageScaffoldWithGradient extends StatelessWidget {
  final BuildContext context;
  final Widget child;

  const PageScaffoldWithGradient({
    Key? key,
    required this.context,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                DSColors.headingLight,
                // DSColors.primaryLight,
                DSColors.headingLight,
              ],
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
