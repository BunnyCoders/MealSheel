// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_sheal/components/button.dart';
import 'package:meal_sheal/components/input_field.dart';
import 'package:meal_sheal/components/section_wrapper.dart';
import 'package:meal_sheal/core/design_system.dart';
import 'package:meal_sheal/views/home/views/profile_tab/view_model.dart';
import 'package:provider/provider.dart';

import '../../../../components/appbar.dart';
import '../../../../components/custom_appbar.dart';
import '../../../../components/page_scaffold.dart';

class ProfileTabView extends StatefulWidget {
  const ProfileTabView({super.key});

  @override
  State<ProfileTabView> createState() => _ProfileTabViewState();
}

class _ProfileTabViewState extends State<ProfileTabView> {
  late ProfileTabViewModel _viewModel;

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
    _addressTextFieldController = TextEditingController(
      text: "No. 23 Lane 3, New York",
    );
    _nameTextFieldController = TextEditingController(
      text: "John Clark",
    );
    _emailTextFieldController = TextEditingController(
      text: "John123@demo.mail",
    );
    _phoneNumberTextFieldController = TextEditingController(
      text: "+911234567890",
    );
    _passwordTextFieldController = TextEditingController(
      text: "************",
    );
    _confirmPasswordTextFieldController = TextEditingController(
      text: "************",
    );
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

  Widget _profilePicture() {
    return Column(
      children: [
        SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/user.jpg"),
              ),
              Positioned(
                right: -2,
                bottom: -5,
                child: SizedBox(
                  height: 46,
                  width: 46,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(
                          color: DSColors.backgroundBodyLight,
                        ),
                      ),
                      // primary: DSColors.backgroundBodyLight,
                      backgroundColor: DSColors.backgroundBodyLight,
                    ),
                    onPressed: () {},
                    child: const Icon(Icons.camera_enhance),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _editProfileLink() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            const Icon(
              Icons.edit,
              color: DSColors.primary,
            ),
            const SizedBox(
              width: DSSizes.sm,
            ),
            Text(
              "Edit Profile",
              style: DSType.subtitle2(
                textColor: DSColors.primary,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _profileFeilds() {
    return SectionWrapper(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
              validator: (String? value) {},
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
              validator: (String? value) {},
            ),
            const SizedBox(height: DSSizes.md),
            InputField(
              controller: _confirmPasswordTextFieldController,
              inputFormatters: const [],
              placeholder: 'Confirm Password',
              validator: (String? value) {},
            ),
            const SizedBox(height: DSSizes.md),
            _saveButton(),
            const SizedBox(height: DSSizes.md),
          ],
        ),
      ),
    );
  }

  Widget _saveButton() {
    return Center(
      child: Button(
        background: DSColors.primary,
        onPressed: () => _viewModel.onTapSave(
          context: context,
          formKey: _formKey,
        ),
        text: "Save",
      ),
    );
  }

  Widget _buildUI() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _profilePicture(),
          const SizedBox(
            height: DSSizes.md,
          ),
          _editProfileLink(),
          const SizedBox(
            height: DSSizes.md,
          ),
          _profileFeilds(),
          const SizedBox(
            height: DSSizes.md,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<ProfileTabViewModel>(context);
    return PageScaffold(
      appBar: CustomAppBarWithOutBackButton(context: context, text: "Profile"),
      children: [_buildUI()],
    );
  }
}
