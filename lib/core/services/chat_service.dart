import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tusdata_message/models/conversation.dart';
import 'package:tusdata_message/models/profile.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Conversation>> getConversations(String userId) {
    var ref = _firestore
        .collection('conversations')
        .where('members', arrayContains: userId);

    var profilesStream = getProfiles().asStream();

    var conversationsStream = ref.snapshots();

    return Rx.combineLatest2(
        conversationsStream,
        profilesStream,
        (QuerySnapshot conversationSnapshot, List<Profile> profiles) =>
            conversationSnapshot.docs.map((snapshop) {
              Map<String, dynamic> data =
                  snapshop.data() as Map<String, dynamic>;
              List<String> members = List.from(data['members']);

              var otherUser = profiles.firstWhere(
                (profile) =>
                    profile.id ==
                    members.firstWhere(
                      (member) => member != userId,
                    ),
              );

              return Conversation.fromSnapshot(snapshop, otherUser);
            }).toList());
  }

  Future<List<Profile>> getProfiles() async {
    var ref = _firestore.collection('profile').orderBy('userName');

    var profiles = await ref.get();

    return profiles.docs
        .map((snapshot) => Profile.fromSnapshot(snapshot))
        .toList();
  }

  Future<Conversation> startConversation(
    User user,
    Profile profile,
  ) async {
    var ref = _firestore.collection('conversations');

    var documentRef = await ref.add({
      "displayMessage": "",
      "members": [user.uid, profile.id]
    });

    return Conversation(
      documentRef.id,
      profile.userName!,
      profile.profileImage!,
      '',
    );
  }

  Future<Conversation> getConversation(
      String conversationId, String memberId) async {
    var profileSnapshot =
        await _firestore.collection('profile').doc(memberId).get();
    var profile = Profile.fromSnapshot(profileSnapshot);
    return Conversation(
        conversationId, profile.userName!, profile.profileImage!, '');
  }
}
