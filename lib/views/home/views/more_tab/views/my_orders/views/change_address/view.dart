import 'package:flutter/material.dart';
import 'package:meal_sheal/components/custom_appbar.dart';
import 'package:meal_sheal/components/page_scaffold.dart';
import 'package:meal_sheal/views/home/views/more_tab/views/my_orders/views/change_address/view_model.dart';
import 'package:provider/provider.dart';

class ChangeAddressView extends StatefulWidget {
  const ChangeAddressView({super.key});

  @override
  State<ChangeAddressView> createState() => _ChangeAddressViewState();
}

class _ChangeAddressViewState extends State<ChangeAddressView> {
  late ChangeAddressViewModel _viewModel;
  Widget _buildUI() {
    return Center(
      child: Column(
        children: <Widget>[Text("Change Address")],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<ChangeAddressViewModel>(context);
    return PageScaffold(
      appBar: CustomAppBar(
          context: context, text: "Change Address", isShowCart: false),
      children: [_buildUI()],
    );
  }
}
