import 'package:tusdata_message/core/services/chat_service.dart';
import 'package:tusdata_message/locator.dart';
import 'package:tusdata_message/models/conversation.dart';
import 'package:tusdata_message/viewmodels/base_model.dart';

class ChatModel extends BaseModel {
  final ChatService _chatService = getIt<ChatService>();

  Stream<List<Conversation>> conversations(String userId) {
    return _chatService.getConversations(userId);
  }
}
