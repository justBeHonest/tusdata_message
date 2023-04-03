import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tusdata_message/models/profile.dart';

class Conversation {
  String id;
  String userName;
  String profileImage;
  String displayMessage;

  Conversation(
    this.id,
    this.userName,
    this.profileImage,
    this.displayMessage,
  );

  factory Conversation.fromSnapshot(
      DocumentSnapshot snapshot, Profile otherUser) {
    Map<String, dynamic>? some = snapshot.data() as Map<String, dynamic>?;
    return Conversation(
      snapshot.id,
      otherUser.userName!,
      otherUser.profileImage!,
      some!['displayMessage'],
    );
  }
}
