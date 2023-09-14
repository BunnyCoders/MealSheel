import 'package:flutter/material.dart';
import 'package:meal_sheal/components/custom_appbar.dart';
import 'package:meal_sheal/components/page_scaffold.dart';
import 'package:meal_sheal/core/design_system.dart';
import 'package:meal_sheal/views/home/views/more_tab/views/notifications/view_model.dart';
import 'package:provider/provider.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  late NotificationsViewModel _viewModel;

  Widget _notifications() => Column(children: [
        LimitedBox(
          maxHeight: double.infinity,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _viewModel.notificationMsgs.length,
            itemBuilder: (BuildContext context, int index) => Card(
              elevation: 2,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: DSColors.primary,
                  radius: 5,
                ),
                title: Text(
                  _viewModel.notificationMsgs[index],
                  style: DSType.subtitle1(textColor: DSColors.linkDark),
                ),
                subtitle: Text(
                  "Now",
                  style: DSType.subtitle2(textColor: DSColors.placeHolderLight),
                ),
              ),
            ),
          ),
        )
      ]);

  Widget _buildUI() {
    return Center(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: DSSizes.md,
          ),
          _notifications(),
          const SizedBox(
            height: DSSizes.md,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<NotificationsViewModel>(context);
    return PageScaffold(
      appBar: CustomAppBar(
        context: context,
        text: "Notifications",
        isShowCart: true,
      ),
      children: [
        _buildUI(),
      ],
    );
  }
}
