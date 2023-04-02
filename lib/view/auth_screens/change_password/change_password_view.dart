import 'package:flutter/material.dart';
import 'package:tusdata_message/core/components/fixed_app_bar_white_theme.dart';
import 'package:tusdata_message/core/components/h5.dart';
import 'package:tusdata_message/core/components/radius_button.dart';
import 'package:nb_utils/nb_utils.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  TextEditingController sampleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FixedAppBarWhiteTheme(
        title: "Change Password",
      ),
      body: ListView(
        children: [
          _passwordTextField(
            header: "Current Password",
            controller: sampleController,
          ),
          _passwordTextField(
            header: "New Password",
            controller: sampleController,
          ),
          _passwordTextField(
            header: "Repeat New Password",
            controller: sampleController,
          ),
          RadiusButton(
            onPressed: () {},
            text: "Update Password",
            leftIcon: Icons.save,
          ).paddingAll(16),
        ],
      ),
    );
  }

  Widget _passwordTextField({
    required String header,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        H5(
          header,
          fontWeight: FontWeight.normal,
        ).paddingLeft(8),
        10.height,
        AppTextField(
          controller: controller,
          textFieldType: TextFieldType.PASSWORD,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.only(left: 20.0, bottom: 8.0, top: 8.0),
            hintStyle: TextStyle(color: gray),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: lightGray),
              borderRadius: BorderRadius.circular(100),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: lightGray),
              borderRadius: BorderRadius.circular(100),
            ),
            hintText: "••••••••",
          ),
        ),
      ],
    ).paddingAll(16);
  }
}
