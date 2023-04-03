import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tusdata_message/locator.dart';
import 'package:tusdata_message/models/conversation.dart';
import 'package:tusdata_message/screens/conversation_page.dart';
import 'package:tusdata_message/viewmodels/chat_model.dart';
import 'package:tusdata_message/viewmodels/sign_in_model.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = getIt<ChatModel>();
    final user = Provider.of<SignInModel>(context).currentUser;

    return ChangeNotifierProvider(
      create: (context) => model,
      child: StreamBuilder<List<Conversation>>(
        stream: model.conversations(user!.uid),
        builder: (BuildContext context, stream) {
          if (stream.hasError) {
            return Text('Error: ${stream.error}');
          }

          if (stream.connectionState == ConnectionState.waiting) {
            return Text('Loading...');
          }

          return ListView(
            children: stream.data!
                .map(
                  (conversation) => ListTile(
                    leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(conversation.profileImage)),
                    title: Text(conversation.userName),
                    subtitle:
                        Container(child: Text(conversation.displayMessage)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConversationPage(
                            conversation: conversation,
                            userId: user.uid,
                          ),
                        ),
                      );
                    },
                    trailing: Column(
                      children: <Widget>[
                        Text("19:30"),
                        Container(
                          width: 20,
                          height: 20,
                          margin: EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).accentColor),
                          child: Center(
                            child: Text(
                              "16",
                              textScaleFactor: 0.8,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
