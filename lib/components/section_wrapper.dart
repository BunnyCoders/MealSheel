import 'package:flutter/material.dart';
import '../core/design_system.dart';

class SectionWrapper extends StatelessWidget {
  const SectionWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: DSSizes.md,
        right: DSSizes.md,
      ),
      child: child,
    );
  }
}
