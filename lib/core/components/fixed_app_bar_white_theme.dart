import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class FixedAppBarWhiteTheme extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final Color? titleColor;
  final Widget? trailing;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final VoidCallback? onBackButtonTap;

  FixedAppBarWhiteTheme({
    this.bottom,
    Key? key,
    this.title,
    this.leading,
    this.onBackButtonTap,
    this.trailing,
    this.titleColor,
  }) : super(key: key);

  @override
  Size get preferredSize => bottom == null
      ? Size(56, AppBar().preferredSize.height)
      : Size(
          56,
          56 + AppBar().preferredSize.height,
        );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      bottom: this.bottom,
      title: head(),
      actions: [
        trailing ?? SizedBox(),
      ],
      leading: leading ??
          IconButton(
            onPressed: onBackButtonTap ??
                () {
                  Get.back();
                },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: black,
            ),
          ),
      automaticallyImplyLeading: true,
    );
  }

  Widget head() {
    if (title == null) {
      return Image.asset("assets/images/tusdata-logo.png", scale: 4);
    } else {
      return Text(
        title!,
        style: boldTextStyle(
          size: 20,
          color: titleColor ?? black,
        ),
        textAlign: TextAlign.start,
      ).paddingLeft(16);
    }
  }
}
