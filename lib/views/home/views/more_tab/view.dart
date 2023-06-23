import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_sheal/components/links.dart';
import 'package:meal_sheal/views/home/views/more_tab/view_model.dart';
import 'package:provider/provider.dart';

import '../../../../components/appbar.dart';
import '../../../../components/custom_appbar.dart';
import '../../../../components/page_scaffold.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/text_link.dart';
import '../../../../core/design_system.dart';

class MoreTabView extends StatefulWidget {
  const MoreTabView({super.key});

  @override
  State<MoreTabView> createState() => _MoreTabViewState();
}

class _MoreTabViewState extends State<MoreTabView> {
  late MoreTabViewModel _viewModel;
  Widget _links() {
    return SectionWrapper(
      child: Column(
        children: <Widget>[
          // const SizedBox(height: DSSizes.xl),
          Links(
            iconPath: 'assets/icons/card.svg',
            text: "Payment Details",
            onTap: () => _viewModel.onTapPaymentDetails(context: context),
          ),
          const SizedBox(height: DSSizes.md),
          Links(
            iconPath: 'assets/icons/my_orders.svg',
            text: 'My Orders',
            onTap: () => _viewModel.onTapMyOrder(context: context),
          ),
          const SizedBox(height: DSSizes.md),
          Links(
            iconPath: 'assets/icons/notification.svg',
            text: 'Notifications',
            onTap: () => _viewModel.onTapNotification(context: context),
          ),
          const SizedBox(height: DSSizes.md),
          Links(
            iconPath: 'assets/icons/inbox.svg',
            text: 'Inbox',
            onTap: () => _viewModel.onTapInbox(context: context),
          ),
          const SizedBox(height: DSSizes.md),
          Links(
            iconPath: 'assets/icons/about_us.svg',
            text: 'About us',
            onTap: () => _viewModel.onTapAboutUs(context: context),
          ),
        ],
      ),
    );
  }

  Widget _buildUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: DSSizes.md),
        _links(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<MoreTabViewModel>(context);

    return PageScaffold(
      appBar: CustomAppBarWithOutBackButton(
        context: context,
        text: 'More',
      ),
      children: <Widget>[
        _buildUI(),
      ],
    );
  }
}
