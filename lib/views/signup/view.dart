import 'package:flutter/material.dart';
import 'package:meal_sheal/views/signup/view_model.dart';
import 'package:provider/provider.dart';

import '../../components/button.dart';
import '../../components/input_field.dart';
import '../../components/loading_indicator.dart';
import '../../components/page_scaffold_with_gradient.dart';
import '../../components/section_wrapper.dart';
import '../../core/design_system.dart';
import '../../core/router.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late SignUpViewModel _viewModel;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _addressTextFieldController;
  late TextEditingController _nameTextFieldController;
  late TextEditingController _emailTextFieldController;
  late TextEditingController _phoneNumberTextFieldController;
  late TextEditingController _passwordTextFieldController;
  late TextEditingController _confirmPasswordTextFieldController;

  @override
  void initState() {
    super.initState();
    _addressTextFieldController = TextEditingController();
    _nameTextFieldController = TextEditingController();
    _emailTextFieldController = TextEditingController();
    _phoneNumberTextFieldController = TextEditingController();
    _passwordTextFieldController = TextEditingController();
    _confirmPasswordTextFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _addressTextFieldController.dispose;
    _nameTextFieldController.dispose;
    _emailTextFieldController.dispose;
    _phoneNumberTextFieldController.dispose;
    _passwordTextFieldController.dispose;
    _confirmPasswordTextFieldController.dispose;
    super.dispose();
  }

  Widget _signUpInputs() {
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
              controller: _nameTextFieldController,
              inputFormatters: const [],
              placeholder: 'Name',
              validator: (String? value) {},
              // va{lidator: (String? value) =>
              //     (_viewModel.emailValidator(value: value, context: context)),
            ),
            const SizedBox(height: DSSizes.md),
            InputField(
              controller: _emailTextFieldController,
              inputFormatters: const [],
              placeholder: 'Email',
              validator: (String? value) =>
                  (_viewModel.emailValidator(value: value, context: context)),
            ),
            const SizedBox(height: DSSizes.md),
            InputField(
              controller: _phoneNumberTextFieldController,
              inputFormatters: const [],
              placeholder: 'Mobile No.',
              validator: (String? value) {},
            ),
            const SizedBox(height: DSSizes.md),
            InputField(
              controller: _addressTextFieldController,
              inputFormatters: const [],
              placeholder: 'Address',
              validator: (String? value) {},
            ),
            const SizedBox(height: DSSizes.md),
            InputField(
              controller: _passwordTextFieldController,
              inputFormatters: const [],
              placeholder: 'Password',
              validator: (String? value) => (_viewModel.passwordValidator(
                  value: value, context: context)),
            ),
            const SizedBox(height: DSSizes.md),
            InputField(
              controller: _confirmPasswordTextFieldController,
              inputFormatters: const [],
              placeholder: 'Confirm Password',
              validator: (String? value) => (_viewModel.passwordValidator(
                  value: value, context: context)),
            ),
            const SizedBox(height: DSSizes.md),
            _signUpbutton(),
            const SizedBox(height: DSSizes.md),
          ],
        ),
      ),
    );
  }

  Widget _signUpbutton() {
    return Center(
      child: Button(
        background: DSColors.primary,
        onPressed: () => _viewModel.onTapLogin(
          email: _emailTextFieldController.text.trim(),
          password: _passwordTextFieldController.text.trim(),
          context: context,
          formKey: _formKey,
        ),
        text: "Sign In",
      ),
    );
  }

  Widget _alreadyHaveAccountbutton() {
    return InkWell(
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Text(
              "All ready have an Account? login",
              style: DSType.subtitle2(textColor: DSColors.primary),
            ),
          ),
        ),
        onTap: () => Navigator.of(context).pushReplacementNamed(
              RoutePaths.login,
            ));
  }

  Widget _header() {
    return Column(
      children: [
        Text("Sign Up", style: DSType.h4(textColor: DSColors.headingDark)),
        Text("Add your details to sign up",
            style: DSType.h6(textColor: DSColors.headingDark)),
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
                _signUpInputs(),
                const SizedBox(height: DSSizes.md),
                _alreadyHaveAccountbutton(),
                const SizedBox(height: DSSizes.xxxl),
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<SignUpViewModel>(context);

    return PageScaffoldWithGradient(
      context: context,
      child: _buildUI(),
    );
  }
}
