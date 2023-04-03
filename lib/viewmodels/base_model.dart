import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tusdata_message/core/services/auth_service.dart';
import 'package:tusdata_message/core/services/navigator_service.dart';
import 'package:tusdata_message/locator.dart';

abstract class BaseModel with ChangeNotifier {
  final AuthService authService = getIt<AuthService>();

  final NavigatorService navigatorService = getIt<NavigatorService>();

  bool _busy = false;

  bool get busy => _busy;

  set busy(bool state) {
    _busy = state;

    notifyListeners();
  }

  User? get currentUser => authService.currentUser;

  void goBack() {
    navigatorService.pop();
  }
}
