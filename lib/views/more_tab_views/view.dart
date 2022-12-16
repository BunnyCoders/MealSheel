import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/custom_appbar.dart';
import '../../components/page_scaffold.dart';
import '../../components/section_wrapper.dart';
import '../../components/text_link.dart';
import '../../core/design_system.dart';

class MoreTabViewsView extends StatefulWidget {
  const MoreTabViewsView({super.key});

  @override
  State<MoreTabViewsView> createState() => _MoreTabViewsViewState();
}

class _MoreTabViewsViewState extends State<MoreTabViewsView> {
  late MoreTabViewsView _viewModel;

  Widget _links() {
    return SectionWrapper(
      child: Column(
        children: <Widget>[
          const SizedBox(height: DSSizes.xl),
          profileMenu(title: "My profile", onTap: (() {})),
          const SizedBox(height: DSSizes.md),
          TextLink(
            text: 'Payment Details',
            onTap: () {},
          ),
          const SizedBox(height: DSSizes.md),
          TextLink(
            text: 'My Orders',
            onTap: () {},
          ),
          const SizedBox(height: DSSizes.md),
          TextLink(
            text: 'Notifications',
            onTap: () {},
          ),
          const SizedBox(height: DSSizes.md),
          TextLink(
            text: 'Inbox',
            onTap: () {},
          ),
          const SizedBox(height: DSSizes.md),
          TextLink(
            text: 'About us',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget profileMenu({required String title, required VoidCallback onTap}) =>
      ListTile(
          title: Text(
            title,
            style: DSType.subtitle2(),
          ),
          onTap: onTap,
          trailing: const CircleAvatar(
            radius: 15,
            backgroundColor: Color.fromRGBO(227, 229, 232, 1),
            child: Center(
                child: Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: DSColors.placeHolderDark,
            )),
          ));

  Widget _buildUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: DSSizes.lg),
        _links(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<MoreTabViewsView>(context);

    return PageScaffold(
      appBar: CustomAppBar(
        context: context,
        text: 'More',
      ),
      children: <Widget>[
        _buildUI(),
      ],
    );
  }
}
