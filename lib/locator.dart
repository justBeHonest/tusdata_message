import 'package:get_it/get_it.dart';
import 'package:tusdata_message/core/services/auth_service.dart';
import 'package:tusdata_message/core/services/chat_service.dart';
import 'package:tusdata_message/core/services/messaging_service.dart';
import 'package:tusdata_message/core/services/navigator_service.dart';
import 'package:tusdata_message/core/services/storage_service.dart';
import 'package:tusdata_message/viewmodels/chat_model.dart';
import 'package:tusdata_message/viewmodels/contacts_model.dart';
import 'package:tusdata_message/viewmodels/conversation_model.dart';
import 'package:tusdata_message/viewmodels/sign_in_model.dart';
import 'package:tusdata_message/viewmodels/whatsapp_main_model.dart';

GetIt getIt = GetIt.instance;

setupLocators() {
  getIt.registerLazySingleton(() => MessagingService());
  getIt.registerLazySingleton(() => NavigatorService());
  getIt.registerLazySingleton(() => ChatService());
  getIt.registerLazySingleton(() => AuthService());
  getIt.registerLazySingleton(() => StorageService());

  getIt.registerFactory(() => WhatsappMainModel());
  getIt.registerFactory(() => ChatModel());
  getIt.registerFactory(() => SignInModel());
  getIt.registerFactory(() => ContactsModel());
  getIt.registerFactory(() => ConversationModel());
}
