import 'package:flutter/foundation.dart';

@immutable
class ChatMessageModel {

  final String role;
  final String content;

//<editor-fold desc="Data Methods">
  const ChatMessageModel({
    required this.role,
    required this.content,
  });

  factory ChatMessageModel.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return ChatMessageModel(
      role: mapJson['role'] as String,
      content: mapJson['content'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['role'] = role;
    map['content'] = content;
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is ChatMessageModel &&
              runtimeType == other.runtimeType &&
              role == other.role &&
              content == other.content);

  @override
  int get hashCode => role.hashCode ^ content.hashCode;

  @override
  String toString() {
    return 'ChatMessageModel{ role: $role, content: $content,}';
  }

  ChatMessageModel copyWith({
    String? role,
    String? content,
  }) {
    return ChatMessageModel(
      role: role ?? this.role,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'role': role,
      'content': content,
    };
  }

  factory ChatMessageModel.fromMap(Map<String, dynamic> map) {
    return ChatMessageModel(
      role: map['role'] as String,
      content: map['content'] as String,
    );
  }

//</editor-fold>
}
