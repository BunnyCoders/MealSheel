import 'package:flutter/material.dart';
import 'package:meal_sheal/components/appbar.dart';
import 'package:meal_sheal/components/custom_appbar.dart';
import 'package:meal_sheal/components/page_scaffold.dart';
import 'package:meal_sheal/core/design_system.dart';
import 'package:meal_sheal/views/home/views/more_tab/views/about_us/view_model.dart';
import 'package:provider/provider.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  late AboutUsViewModel _viewModel;

  Widget _aboutUsText() => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
              style: DSType.caption(textColor: DSColors.linkDark),
            )
          ],
        ),
      );

  Widget _buildUI() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: DSSizes.md,
            ),
            _getLocation()
            // _aboutUsText(),
            // const SizedBox(
            //   height: DSSizes.sm,
            // ),
            // _aboutUsText(),
            // const SizedBox(
            //   height: DSSizes.md,
            // ),
            // _aboutUsText(),
            // const SizedBox(
            //   height: DSSizes.md,
            // ),
          ],
        ),
      ),
    );
  }

  Widget _getLocation() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('LAT: ${_viewModel.currentPosition?.latitude ?? ""}'),
          Text('LNG: ${_viewModel.currentPosition?.longitude ?? ""}'),
          Text('ADDRESS: ${_viewModel.currentAddress ?? ""}'),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: ()=>_viewModel.getCurrentPosition(),
            child: const Text("Get Current Location"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<AboutUsViewModel>(context);
    return PageScaffold(
      appBar: CustomAppBar(
        context: context,
        text: "About US",
        isShowCart: true,
      ),
      children: [
        _buildUI(),
      ],
    );
  }
}
