import 'package:flutter/material.dart';
import 'package:meal_sheal/components/appbar.dart';
import 'package:meal_sheal/components/custom_appbar.dart';
import 'package:meal_sheal/components/page_scaffold.dart';
import 'package:meal_sheal/core/design_system.dart';
import 'package:meal_sheal/views/home/views/more_tab/views/inbox/view_model.dart';
import 'package:provider/provider.dart';

class InboxView extends StatefulWidget {
  const InboxView({super.key});

  @override
  State<InboxView> createState() => _InboxViewState();
}

class _InboxViewState extends State<InboxView> {
  late InboxViewModel _viewModel;

  Widget _notifications() => Column(children: [
        LimitedBox(
          maxHeight: double.infinity,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _viewModel.inboxMsgs.length,
            itemBuilder: (BuildContext context, int index) => Card(
              elevation: 2,
              child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: DSColors.primary,
                    radius: 5,
                  ),
                  title: Text(
                    _viewModel.inboxMsgs[index],
                    style: DSType.subtitle1(textColor: DSColors.linkDark),
                  ),
                  subtitle: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                    style:
                        DSType.subtitle2(textColor: DSColors.placeHolderLight),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "12:00",
                        style: DSType.subtitle2(
                            textColor: DSColors.placeHolderLight),
                      ),
                      const Icon(
                        Icons.star_border_outlined,
                        size: DSSizes.md,
                        color: DSColors.primary,
                      ),
                    ],
                  )),
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
    _viewModel = Provider.of<InboxViewModel>(context);
    return PageScaffold(
      appBar: CustomAppBar(context: context, text: "Inbox"),
      children: [_buildUI()],
    );
  }
}
