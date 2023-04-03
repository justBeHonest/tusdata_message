import 'package:tusdata_message/core/services/auth_service.dart';
import 'package:tusdata_message/core/services/messaging_service.dart';
import 'package:tusdata_message/locator.dart';
import 'package:tusdata_message/screens/whatsapp_main.dart';
import 'package:tusdata_message/viewmodels/base_model.dart';

class SignInModel extends BaseModel {
  final AuthService _authService = getIt<AuthService>();
  final MessagingService _messagingService = getIt<MessagingService>();

  Future<void> signIn(String userName) async {
    if (userName.isEmpty) return;

    busy = true;

    var user = await _authService.signInAnonymously();

    var token = await _messagingService.getUserToken();

    await _authService.setUserProfile(user!, userName, token!);

    busy = false;

    await navigatorService.navigateAndReplace(WhatsAppMain());
  }
}
