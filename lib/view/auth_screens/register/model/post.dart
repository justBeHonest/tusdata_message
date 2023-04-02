// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  String? name;
  String? lasName;
  int? age;
  String? email;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;

  Post({
    this.name,
    this.lasName,
    this.age,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  /// Connect the generated [_PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
