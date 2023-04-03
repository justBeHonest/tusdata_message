import 'package:tusdata_message/screens/contacts_page.dart';
import 'package:tusdata_message/viewmodels/base_model.dart';

class WhatsappMainModel extends BaseModel {
  openContacts() async {
    await navigatorService.navigateTo(ContactsPage());
  }
}
