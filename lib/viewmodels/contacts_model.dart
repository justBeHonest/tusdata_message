import 'dart:async';

import 'package:tusdata_message/core/services/chat_service.dart';
import 'package:tusdata_message/locator.dart';
import 'package:tusdata_message/models/profile.dart';
import 'package:tusdata_message/screens/conversation_page.dart';
import 'package:tusdata_message/viewmodels/base_model.dart';

class ContactsModel extends BaseModel {
  final ChatService _chatService = getIt<ChatService>();

  Future<List<Profile>> filterProfiles(String filter) async {
    return (await _chatService.getProfiles())
        .where((element) => element.userName!.startsWith(filter))
        .toList();
  }

  Future<void> startConversation(Profile profile) async {
    var conversation =
        await _chatService.startConversation(currentUser!, profile);

    navigatorService.navigateTo(ConversationPage(
      conversation: conversation,
      userId: currentUser!.uid,
    ));
  }
}
