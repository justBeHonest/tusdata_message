// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:tusdata_message/core/components/fixed_app_bar_white_theme.dart';
import 'package:tusdata_message/core/constants/decoration_constants.dart';
import 'package:tusdata_message/core/extension/context_extention.dart';
import 'package:tusdata_message/core/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';

class ForgotPasswordView extends StatefulWidget {
  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
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
              children: <Widget>[
                20.height,
                Text("Parolamı unuttum", style: boldTextStyle(size: 24)),
                8.height,
                Text(
                  "Email adresinizi girin ardından size parolanızı sıfırlamanız için göndereceğimiz link üzerinden parolanızı sıfırlayabilirsiniz.",
                  style: secondaryTextStyle(),
                ),
                16.height,
                _emailField(),
                16.height,
                _sendMailButton(),
              ],
            ).paddingOnly(right: 16.0, left: 16.0),
          ),
        ),
      ),
    );
  }

  Widget _sendMailButton() {
    return OutlinedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(5),
        backgroundColor: MaterialStateProperty.all(mlPrimaryColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Parola sıfırlama maili gönder",
              style: boldTextStyle(color: white)),
        ],
      ).paddingSymmetric(vertical: 15),
    );
  }

  AppTextField _emailField() {
    return AppTextField(
      controller: TextEditingController(),
      textFieldType: TextFieldType.EMAIL,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.only(left: 20.0, bottom: 8.0, top: 8.0),
        hintStyle: const TextStyle(color: gray),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: lightGray),
          borderRadius: BorderRadius.circular(100),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: lightGray),
          borderRadius: BorderRadius.circular(100),
        ),
        hintText: "örnek@tusdata.com",
      ),
    );
  }

  Decoration _decoration() {
    return boxDecorationWithRoundedCorners(backgroundColor: context.cardColor);
  }
}
