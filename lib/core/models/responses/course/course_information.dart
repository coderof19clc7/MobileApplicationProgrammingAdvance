import 'package:one_one_learn/core/models/responses/course/course_topic.dart';
import 'package:one_one_learn/core/models/responses/user/user_info.dart';

class CourseInformation {
  final String? id;
  final String? name;
  final String? description;
  final String? imageUrl;
  final String? level;
  final String? reason;
  final String? purpose;
  final String? otherDetails;
  final String? createdAt;
  final String? updatedAt;
  final List<CourseTopic>? topics;
  final List<UserInfo>? users;

//<editor-fold desc="Data Methods">
  const CourseInformation({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.level,
    this.reason,
    this.purpose,
    this.otherDetails,
    this.createdAt,
    this.updatedAt,
    this.topics,
    this.users,
  });

  factory CourseInformation.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;

    List<CourseTopic>? topics;
    if (mapJson['topics'] != null) {
      topics = [];
      for (final v in mapJson['topics'] as List) {
        topics.add(CourseTopic.fromJson(v));
      }
    }

    List<UserInfo>? users;
    if (mapJson['users'] != null) {
      users = [];
      for (final v in mapJson['users'] as List) {
        users.add(UserInfo.fromJson(v));
      }
    }

    return CourseInformation(
      id: mapJson['id'] as String?,
      name: mapJson['name'] as String?,
      description: mapJson['description'] as String?,
      imageUrl: mapJson['imageUrl'] as String?,
      level: mapJson['level'] as String?,
      reason: mapJson['reason'] as String?,
      purpose: mapJson['purpose'] as String?,
      otherDetails: mapJson['otherDetails'] as String?,
      createdAt: mapJson['createdAt'] as String?,
      updatedAt: mapJson['updatedAt'] as String?,
      topics: topics,
      users: users,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['imageUrl'] = imageUrl;
    map['level'] = level;
    map['reason'] = reason;
    map['purpose'] = purpose;
    map['otherDetails'] = otherDetails;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;

    if (topics != null) {
      map['topics'] = topics!.map((v) => v.toJson()).toList();
    }

    if (users != null) {
      map['users'] = users!.map((v) => v.toJson()).toList();
    }

    return map;
  }

  @override
  String toString() {
    return 'CourseInformation{'
        ' id: $id,'
        ' name: $name,'
        ' description: $description,'
        ' imageUrl: $imageUrl,'
        ' level: $level,'
        ' reason: $reason,'
        ' purpose: $purpose,'
        ' otherDetails: $otherDetails,'
        ' createdAt: $createdAt,'
        ' updatedAt: $updatedAt,'
        ' topics: $topics,'
        ' users: $users,'
        ' }';
  }

  CourseInformation copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    String? level,
    String? reason,
    String? purpose,
    String? otherDetails,
    String? createdAt,
    String? updatedAt,
    List<CourseTopic>? topics,
    List<UserInfo>? users,
  }) {
    return CourseInformation(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      level: level ?? this.level,
      reason: reason ?? this.reason,
      purpose: purpose ?? this.purpose,
      otherDetails: otherDetails ?? this.otherDetails,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      topics: topics ?? this.topics,
      users: users ?? this.users,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};

    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['imageUrl'] = imageUrl;
    map['level'] = level;
    map['reason'] = reason;
    map['purpose'] = purpose;
    map['otherDetails'] = otherDetails;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;

    if (topics != null) {
      map['topics'] = topics!.map((v) => v.toJson()).toList();
    }

    if (users != null) {
      map['users'] = users!.map((v) => v.toJson()).toList();
    }

    return map;
  }

  factory CourseInformation.fromMap(Map<String, dynamic> map) {

    List<CourseTopic>? topics;
    if (map['topics'] != null) {
      topics = [];
      for (final v in map['topics'] as List) {
        topics.add(CourseTopic.fromJson(v));
      }
    }

    List<UserInfo>? users;
    if (map['users'] != null) {
      users = [];
      for (final v in map['users'] as List) {
        users.add(UserInfo.fromJson(v));
      }
    }

    return CourseInformation(
      id: map['id'] as String?,
      name: map['name'] as String?,
      description: map['description'] as String?,
      imageUrl: map['imageUrl'] as String?,
      level: map['level'] as String?,
      reason: map['reason'] as String?,
      purpose: map['purpose'] as String?,
      otherDetails: map['otherDetails'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      topics: topics,
      users: users,
    );
  }

//</editor-fold>
}
