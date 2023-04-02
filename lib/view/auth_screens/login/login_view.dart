// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:tusdata_message/core/components/h4.dart';
import 'package:tusdata_message/core/components/radius_button.dart';
import 'package:tusdata_message/core/constants/decoration_constants.dart';
import 'package:tusdata_message/core/extension/context_extention.dart';
import 'package:tusdata_message/core/utils/colors.dart';
import 'package:tusdata_message/core/utils/common.dart';
import 'package:tusdata_message/view/privacy_policy/privacy_policy.dart';
import 'package:tusdata_message/view/privacy_policy/subscription_terms.dart';
import 'package:tusdata_message/view/privacy_policy/terms_of_use.dart';
import 'package:nb_utils/nb_utils.dart';

import '../forgot_password/forgot_pasword_view.dart';
import '../register/register_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.cardColor,
          body: Container(
            height: context.h,
            decoration: DecorationConstants.instance.backGroundDecoration,
            child: loginForm(),
          )),
    );
  }

  SingleChildScrollView loginForm() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          context.dynamicHeight(0.08).toInt().height,
          commonCachedNetworkImage(
            "assets/images/tusdata-logo.png",
            alignment: Alignment.center,
            width: 200,
            height: 120,
          ).center(),
          Text("Giriş Yap", style: boldTextStyle(size: 20)).center(),
          30.height,
          _emailTextField().paddingBottom(15),
          _passwordTextField().paddingBottom(15),
          8.height,
          _forgotPassword(),
          24.height,
          _loginButton(),
          22.height,
          _register(),
          32.height,
          _privacyPolicyText().paddingAll(16),
        ],
      ).paddingSymmetric(horizontal: 35),
    );
  }

  RichText _privacyPolicyText() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black87,
          fontFamily: 'PublicaSans',
          fontSize: 16,
        ),
        children: [
          TextSpan(text: "Kayıt olarak "),
          TextSpan(
            text: "Gizlilik politikası",
            style: _pinkStyle(),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.to(
                  () => PrivacyPolicy(),
                  transition: Transition.cupertino,
                );
              },
          ), // blue
          TextSpan(text: ", "),
          TextSpan(
            text: "Abonelik koşulları ",
            style: _pinkStyle(),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.to(
                  () => SubscriptionTermsView(),
                  transition: Transition.cupertino,
                );
              },
          ), // blue
          TextSpan(text: "ve "),
          TextSpan(
            text: "Kullanım şartlarını ",
            style: _pinkStyle(),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.to(
                  () => TermsOfUseView(),
                  transition: Transition.cupertino,
                );
              },
          ), //blue
          TextSpan(text: "Kabul etmiş olursunuz"),
        ],
      ),
    );
  }

  TextStyle _pinkStyle() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      color: mlPrimaryColor,
      fontSize: 16,
    );
  }

  Row _register() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Hesabınız yok mu?",
        ),
        8.width,
        Text(
          "Kayıt Ol",
          style: _pinkStyle().copyWith(fontWeight: FontWeight.w600),
        ).onTap(
          () => Get.to(
            () => RegisterView(),
            transition: Transition.cupertino,
          ),
        ),
      ],
    );
  }

  Widget _loginButton() {
    return RadiusButton(
      onPressed: () {},
      text: "Giriş Yap",
      rightIcon: Icons.arrow_forward_ios,
    );
  }

  Align _forgotPassword() {
    return Align(
      alignment: Alignment.topRight,
      child:
          Text("Parolamı unuttum", style: secondaryTextStyle(size: 16)).onTap(
        () => Get.to(
          () => ForgotPasswordView(),
          transition: Transition.cupertino,
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const H4(
          "Parola",
          fontWeight: FontWeight.normal,
        ).paddingAll(8),
        AppTextField(
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
            hintText: "••••••••",
          ),
        ),
      ],
    );
  }

  Widget _emailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        H4(
          "Email",
          fontWeight: FontWeight.normal,
        ).paddingAll(8),
        AppTextField(
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
        ),
      ],
    );
  }
}
