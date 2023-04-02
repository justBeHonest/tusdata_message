import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tusdata_message/core/controller/ui.dart';
import 'package:tusdata_message/core/utils/app_theme.dart';
import 'package:tusdata_message/view/auth_screens/login/login_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    UI.setStatusBarPrimaryColor();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      home: LoginView(),
      theme: AppThemeData.lightTheme,
    );
  }
}
