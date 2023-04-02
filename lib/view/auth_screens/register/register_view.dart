// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:tusdata_message/core/components/fixed_app_bar_white_theme.dart';
import 'package:tusdata_message/core/components/h2.dart';
import 'package:tusdata_message/core/components/radius_button.dart';
import 'package:tusdata_message/core/constants/decoration_constants.dart';
import 'package:tusdata_message/core/extension/context_extention.dart';
import 'package:nb_utils/nb_utils.dart';

class RegisterView extends StatefulWidget {
  static String tag = '/MLRegistrationScreen';

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: FixedAppBarWhiteTheme(),
        body: Container(
          height: context.h,
          decoration: DecorationConstants.instance.backGroundDecoration,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                H2(
                  "Kayıt Ol",
                  fontWeight: FontWeight.normal,
                  width: context.w,
                  textAlign: TextAlign.center,
                ),
                //Text(mlRegister!, style: boldTextStyle(size: 28)),
                4.height,
                Text(
                  "Formu doldurup kayıt olun",
                  style: secondaryTextStyle(size: 16),
                ).center(),
                24.height,
                // PinCodeTextField(
                //   controller: _viewModel.tokenController,
                //   appContext: context,
                //   length: 6,
                //   onChanged: (str) {
                //     setState(() {});
                //   },
                //   animationType: AnimationType.fade,
                //   pinTheme: PinTheme(
                //     shape: PinCodeFieldShape.box,
                //     borderRadius: BorderRadius.circular(5),
                //     fieldHeight: 50,
                //     fieldWidth: 40,
                //   ),
                // ).paddingSymmetric(horizontal: 16),
                // Observer(builder: (_) {
                //   return Text(
                //       "${_viewModel.tokenController.text.length}/6");
                // }),
                Text("Email").paddingLeft(8),
                _emailTextField(),
                24.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("İsim").paddingLeft(8),
                        _firstnameTextField()
                            .withWidth(context.dynamicWidth(0.45)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Soyisim").paddingLeft(8),
                        _lastnameTextField()
                            .withWidth(context.dynamicWidth(0.45)),
                      ],
                    ),
                  ],
                ),
                24.height,
                Text("Parola").paddingLeft(8),
                _passwordTextField(),
                24.height,
                Text("Parolayı Yeniden Girin").paddingLeft(8),
                _confirmPasswordTextField(),
                48.height,
                _registerButton(),
              ],
            ).paddingOnly(left: 16, right: 16, bottom: 32),
          ).center(),
        ),
      ),
    );
  }

  Widget _registerButton() {
    return RadiusButton(
      onPressed: () {},
      text: "Kayıt Ol",
    );
  }

  AppTextField _confirmPasswordTextField() {
    return AppTextField(
      controller: TextEditingController(),
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
        hintText: "************",
      ),
    );
  }

  AppTextField _passwordTextField() {
    return AppTextField(
      controller: TextEditingController(),
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
        hintText: "************",
      ),
    );
  }

  AppTextField _emailTextField() {
    return AppTextField(
      controller: TextEditingController(),
      textFieldType: TextFieldType.EMAIL,
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
        hintText: "örnek@tusdata.com",
      ),
    );
  }

  AppTextField _firstnameTextField() {
    return AppTextField(
      controller: TextEditingController(),
      textFieldType: TextFieldType.OTHER,
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
        hintText: "İsim",
      ),
    );
  }

  AppTextField _lastnameTextField() {
    return AppTextField(
      controller: TextEditingController(),
      textFieldType: TextFieldType.OTHER,
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
        hintText: "Soyisim",
      ),
    );
  }
}
