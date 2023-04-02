// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class TestUser {
  final String? username;
  final String? email;
  final String? password;

  TestUser(
    this.username,
    this.email,
    this.password,
  );

  factory TestUser.fromJson(Map<String, dynamic> json) =>
      _$TestUserFromJson(json);

  /// Connect the generated [_PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TestUserToJson(this);

  // Map<String, dynamic> toMapWithPw() => _$UserToJsonPw(this);
}
