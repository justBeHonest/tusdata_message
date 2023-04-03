import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:tusdata_message/core/services/chat_service.dart';
import 'package:tusdata_message/core/services/navigator_service.dart';
import 'package:tusdata_message/screens/conversation_page.dart';

import '../../locator.dart';

class MessagingService {
  final NavigatorService _navigatorService = getIt<NavigatorService>();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final ChatService _chatService = getIt<ChatService>();

  MessagingService() {
    // _firebaseMessaging.configure(
    //   onLaunch: _notificationClicked,
    //   onResume: _notificationClicked,
    // );
  }

  Future _notificationClicked(Map<String, dynamic> message) async {
    var data = message['data'];
    var conversation = await _chatService.getConversation(
        data['conversationId'], data['userId']);
    await _navigatorService.navigateTo(ConversationPage(
      conversation: conversation,
      userId: data['memberId'],
    ));
  }

  Future<String?> getUserToken() {
    return _firebaseMessaging.getToken();
  }
}
