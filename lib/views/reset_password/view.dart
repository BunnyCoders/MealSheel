import 'package:flutter/material.dart';
import 'package:meal_sheal/views/reset_password/view_model.dart';
import 'package:provider/provider.dart';

import '../../components/button.dart';
import '../../components/input_field.dart';
import '../../components/loading_indicator.dart';
import '../../components/page_scaffold_with_gradient.dart';
import '../../components/section_wrapper.dart';
import '../../core/design_system.dart';
import '../../core/router.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  late ResetPasswordViewModel _viewModel;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailTextFieldController;

  @override
  void initState() {
    super.initState();
    // Provider.of<LoginViewModel>(context, listen: false)
    //     .callInternetAvailablavilityCheck(context: context);

    _emailTextFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextFieldController.dispose();
    super.dispose();
  }

  Widget _inputs() {
    return SectionWrapper(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _viewModel.errorMessage != ''
                ? Column(
                    children: <Widget>[
                      const SizedBox(height: DSSizes.lg),
                      Text(
                        _viewModel.errorMessage,
                        style: DSType.subtitle1(textColor: DSColors.error),
                      ),
                    ],
                  )
                : Container(),
            const SizedBox(height: DSSizes.lg),
            InputField(
              controller: _emailTextFieldController,
              inputFormatters: const [],
              placeholder: 'Your Email',
              validator: (String? value) =>
                  (_viewModel.emailValidator(value: value, context: context)),
            ),
            const SizedBox(height: DSSizes.md),
            _sendbutton(),
          ],
        ),
      ),
    );
  }

  Widget _sendbutton() {
    return Center(
      child: Button(
        background: DSColors.primary,
        // onPressed: () {},
        // Navigator.of(context).pushReplacementNamed(
        //   RoutePaths.home,
        // ),
        onPressed: () => _viewModel.onTapSend(
          email: _emailTextFieldController.text.trim(),
          context: context,
          formKey: _formKey,
        ),
        text: "Send",
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        Text("Reset Password",
            style: DSType.h4(textColor: DSColors.headingDark)),
        Text("Please Enter your email to receive a link",
            style: DSType.subtitle2(textColor: DSColors.placeHolderDark)),
        Text("to create a new password via email",
            style: DSType.subtitle2(textColor: DSColors.placeHolderDark)),
      ],
    );
  }

  Widget _buildUI() {
    return _viewModel.isLoading
        ? const LoadingIndicator()
        : Center(
            child: Column(
              children: <Widget>[
                const SizedBox(height: DSSizes.xl),
                _header(),
                const SizedBox(height: DSSizes.md),
                _inputs(),
                const SizedBox(height: DSSizes.xxxl),
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<ResetPasswordViewModel>(context);

    return PageScaffoldWithGradient(
      context: context,
      child: _buildUI(),
    );
  }
}
