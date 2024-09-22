// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String title;
  final String content;
  final int timestamp;
  final String authorUid;
  final String authorName;
  PostModel({
    required this.title,
    required this.content,
    required this.timestamp,
    required this.authorUid,
    required this.authorName,
  });

  factory PostModel.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;

    return PostModel(
      title: data['title']?.toString() ?? '',
      content: data['content']?.toString() ?? '',
      timestamp: int.tryParse(doc.id) ?? 0,
      authorName: data['authorName']?.toString() ?? '',
      authorUid: data['authorUid']?.toString() ?? '',
    );
  }

  PostModel copyWith({
    String? title,
    String? content,
    int? timestamp,
    String? authorUid,
    String? authorName,
  }) =>
      PostModel(
        title: title ?? this.title,
        content: content ?? this.content,
        timestamp: timestamp ?? this.timestamp,
        authorUid: authorUid ?? this.authorUid,
        authorName: authorName ?? this.authorName,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'title': title,
        'content': content,
        'timestamp': timestamp,
        'authorUid': authorUid,
        'authorName': authorName,
      };

  factory PostModel.fromMap(Map<String, dynamic> map) => PostModel(
        title: map['title'] as String,
        content: map['content'] as String,
        timestamp: map['timestamp'] as int,
        authorUid: map['authorUid'] as String,
        authorName: map['authorName'] as String,
      );

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PostModel(title: $title, content: $content, timestamp: $timestamp, authorUid: $authorUid, authorName: $authorName)';

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.content == content &&
        other.timestamp == timestamp &&
        other.authorUid == authorUid &&
        other.authorName == authorName;
  }

  @override
  int get hashCode =>
      title.hashCode ^
      content.hashCode ^
      timestamp.hashCode ^
      authorUid.hashCode ^
      authorName.hashCode;
}
