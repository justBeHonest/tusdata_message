import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:tusdata_message/core/controller/ui.dart';
import 'package:tusdata_message/core/services/navigator_service.dart';
import 'package:tusdata_message/core/utils/app_theme.dart';
import 'package:tusdata_message/locator.dart';
import 'package:tusdata_message/view/auth_screens/login/login_view.dart';
import 'package:tusdata_message/viewmodels/sign_in_model.dart';

bool USE_FIRESTORE_EMULATOR = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (USE_FIRESTORE_EMULATOR) {
    FirebaseFirestore.instance.settings = Settings(
      host: 'localhost:8080',
      sslEnabled: false,
      persistenceEnabled: false,
    );
  }
  setupLocators();
  runApp(MyApp());
}

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
    return ChangeNotifierProvider(
      create: (context) => getIt<SignInModel>(),
      child: Consumer<SignInModel>(
        builder: (context, signIn, child) => GetMaterialApp(
          navigatorKey: getIt<NavigatorService>().navigatorKey,
          title: 'Material App',
          home: LoginView(),
          theme: AppThemeData.lightTheme,
        ),
      ),
    );
  }
}
