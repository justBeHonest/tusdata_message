// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';

// Package imports:
import 'package:tusdata_message/core/components/fixed_app_bar_white_theme.dart';
import 'package:tusdata_message/core/extension/context_extention.dart';
import 'package:nb_utils/nb_utils.dart';

class TermsOfUseView extends StatefulWidget {
  const TermsOfUseView({Key? key}) : super(key: key);
  @override
  State<TermsOfUseView> createState() => _TermsOfUseViewState();
}

class _TermsOfUseViewState extends State<TermsOfUseView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: FixedAppBarWhiteTheme(
          title: "Kullanım şartları",
        ),
        body: SizedBox(
          height: context.h,
          child: ListView(
            children: [
              _content(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _content() {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        var content = snapshot.data.toString();
        return Container(
          decoration: boxDecorationWithRoundedCorners(),
          child: Html(
            data: content,
          ),
        );
      },
    ).paddingAll(16);
  }

  Future<String> getData() async {
    return rootBundle.loadString("assets/html/terms_of_use.html");
  }
}
