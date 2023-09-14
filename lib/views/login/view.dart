import 'package:flutter/material.dart';
import 'package:meal_sheal/components/button.dart';
import 'package:meal_sheal/components/section_wrapper.dart';
import 'package:meal_sheal/components/text_link.dart';
import 'package:meal_sheal/views/login/view_model.dart';
import 'package:provider/provider.dart';

import '../../components/input_field.dart';
import '../../components/loading_indicator.dart';
import '../../components/page_scaffold_with_gradient.dart';
import '../../core/design_system.dart';
import '../../core/router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginViewModel _viewModel;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailTextFieldController;
  late TextEditingController _passwordTextFieldController;

  @override
  void initState() {
    super.initState();
    // Provider.of<LoginViewModel>(context, listen: false)
    //     .callInternetAvailablavilityCheck(context: context);

    _emailTextFieldController = TextEditingController();
    _passwordTextFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextFieldController.dispose();
    _passwordTextFieldController.dispose();
    super.dispose();
  }

  Widget _loginInputs() {
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
            InputField(
              controller: _passwordTextFieldController,
              inputFormatters: const [],
              placeholder: 'Your Password',
              validator: (String? value) => (_viewModel.passwordValidator(
                  value: value, context: context)),
            ),
            const SizedBox(height: DSSizes.md),
            _loginbutton(),
            const SizedBox(height: DSSizes.md),
            _forgetPaswordbutton(),
            const SizedBox(height: DSSizes.xl),
            Center(
              child: Text(
                "Or Login with",
                style: DSType.subtitle2(textColor: DSColors.placeHolderDark),
              ),
            ),
            const SizedBox(height: DSSizes.md),
            _loginWithFacebookButton(),
            const SizedBox(height: DSSizes.md),
            _loginWithGooglebutton(),
            const SizedBox(height: DSSizes.md),
            // _alreadyHaveAccountbutton(),
            // const SizedBox(height: DSSizes.md),
          ],
        ),
      ),
    );
  }

  Widget _loginbutton() {
    return Center(
      child: Button(
        background: DSColors.primary,
        onPressed: () => Navigator.of(context).pushReplacementNamed(
          RoutePaths.home,
        ),
        // onPressed: () => _viewModel.onTapLogin(
        //   email: _emailTextFieldController.text.trim(),
        //   password: _passwordTextFieldController.text.trim(),
        //   context: context,
        //   formKey: _formKey,
        // ),
        text: "Login",
      ),
    );
  }

  Widget _loginWithFacebookButton() {
    return Center(
      child: Button(
        background: DSColors.secondary,
        textColor: DSColors.primary,
        onPressed: () {},
        text: "Login with facebook",
      ),
    );
  }

  Widget _loginWithGooglebutton() {
    return Center(
      child: Button(
        background: Colors.red,
        onPressed: () {},
        text: "Login with google",
      ),
    );
  }

  Widget _forgetPaswordbutton() {
    return InkWell(
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Text(
              "Forget your password?",
              style: DSType.subtitle2(textColor: DSColors.placeHolderDark),
            ),
          ),
        ),
        onTap: () => Navigator.of(context).pushReplacementNamed(
              RoutePaths.resetPassword,
            ));
  }

  Widget _alreadyHaveAccountbutton() {
    return InkWell(
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Text(
              "All ready have an Account? SignUp",
              style: DSType.subtitle2(textColor: DSColors.primary),
            ),
          ),
        ),
        onTap: () => Navigator.of(context).pushReplacementNamed(
              RoutePaths.signup,
            ));
  }

  Widget _header() {
    return Column(
      children: [
        Text("Login", style: DSType.h5(textColor: DSColors.primaryFontColor)),
        Text("Add your login details",
            style: DSType.body2(textColor: DSColors.secondaryFontColor)),
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
                _loginInputs(),
                const SizedBox(height: DSSizes.md),
                _alreadyHaveAccountbutton(),
                const SizedBox(height: DSSizes.xxxl),
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<LoginViewModel>(context);

    return PageScaffoldWithGradient(
      context: context,
      child: _buildUI(),
    );
  }
}
