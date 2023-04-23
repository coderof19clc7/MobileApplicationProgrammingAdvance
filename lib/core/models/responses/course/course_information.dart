import 'package:one_one_learn/core/models/responses/course/course_category.dart';
import 'package:one_one_learn/core/models/responses/course/course_topic.dart';
import 'package:one_one_learn/core/models/responses/course/tutor_course.dart';
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
  final int? default_price;
  final int? course_price;
  final dynamic courseType;
  final dynamic sectionType;
  final bool? visible;
  final dynamic displayOrder;
  final String? createdAt;
  final String? updatedAt;
  final TutorCourse? tutorCourse;
  final List<CourseTopic>? topics;
  final List<UserInfo>? users;
  final List<CourseCategory>? categories;

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
    this.default_price,
    this.course_price,
    this.courseType,
    this.sectionType,
    this.visible,
    this.displayOrder,
    this.createdAt,
    this.updatedAt,
    this.tutorCourse,
    this.topics,
    this.users,
    this.categories,
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

    List<CourseCategory>? categories;
    if (mapJson['categories'] != null) {
      categories = [];
      for (final v in mapJson['categories'] as List) {
        categories.add(CourseCategory.fromJson(v));
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
      default_price: mapJson['default_price'] as int?,
      course_price: mapJson['course_price'] as int?,
      courseType: mapJson['courseType'],
      sectionType: mapJson['sectionType'],
      visible: mapJson['visible'] as bool?,
      displayOrder: mapJson['displayOrder'],
      createdAt: mapJson['createdAt'] as String?,
      updatedAt: mapJson['updatedAt'] as String?,
      tutorCourse: mapJson['TutorCourse'] != null
          ? TutorCourse.fromJson(mapJson['TutorCourse'])
          : null,
      topics: topics,
      users: users,
      categories: categories,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    
    if (id != null) {
      map['id'] = id;
    }
    if (name != null) {
      map['name'] = name;
    }
    if (description != null) {
      map['description'] = description;
    }
    if (imageUrl != null) {
      map['imageUrl'] = imageUrl;
    }
    if (level != null) {
      map['level'] = level;
    }
    if (reason != null) {
      map['reason'] = reason;
    }
    if (purpose != null) {
      map['purpose'] = purpose;
    }
    if (otherDetails != null) {
      map['otherDetails'] = otherDetails;
    }
    if (default_price != null) {
      map['default_price'] = default_price;
    }
    if (course_price != null) {
      map['course_price'] = course_price;
    }
    if (courseType != null) {
      map['courseType'] = courseType;
    }
    if (sectionType != null) {
      map['sectionType'] = sectionType;
    }
    if (visible != null) {
      map['visible'] = visible;
    }
    if (displayOrder != null) {
      map['displayOrder'] = displayOrder;
    }
    if (createdAt != null) {
      map['createdAt'] = createdAt;
    }
    if (updatedAt != null) {
      map['updatedAt'] = updatedAt;
    }
    if (tutorCourse != null) {
      map['TutorCourse'] = tutorCourse!.toJson();
    }
    if (topics != null) {
      map['topics'] = topics!.map((v) => v.toJson()).toList();
    }
    if (users != null) {
      map['users'] = users!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      map['categories'] = categories!.map((v) => v.toJson()).toList();
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
        ' default_price: $default_price,'
        ' course_price: $course_price,'
        ' courseType: $courseType,'
        ' sectionType: $sectionType,'
        ' visible: $visible,'
        ' displayOrder: $displayOrder,'
        ' createdAt: $createdAt,'
        ' updatedAt: $updatedAt,'
        ' tutorCourse: $tutorCourse,'
        ' topics: $topics,'
        ' users: $users,'
        ' categories: $categories,'
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
    int? default_price,
    int? course_price,
    dynamic courseType,
    dynamic sectionType,
    bool? visible,
    dynamic displayOrder,
    String? createdAt,
    String? updatedAt,
    TutorCourse? tutorCourse,
    List<CourseTopic>? topics,
    List<UserInfo>? users,
    List<CourseCategory>? categories,
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
      default_price: default_price ?? this.default_price,
      course_price: course_price ?? this.course_price,
      courseType: courseType ?? this.courseType,
      sectionType: sectionType ?? this.sectionType,
      visible: visible ?? this.visible,
      displayOrder: displayOrder ?? this.displayOrder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      tutorCourse: tutorCourse ?? this.tutorCourse,
      topics: topics ?? this.topics,
      users: users ?? this.users,
      categories: categories ?? this.categories,
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
    map['default_price'] = default_price;
    map['course_price'] = course_price;
    map['courseType'] = courseType;
    map['sectionType'] = sectionType;
    map['visible'] = visible;
    map['displayOrder'] = displayOrder;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (tutorCourse != null) {
      map['TutorCourse'] = tutorCourse!.toMap();
    }

    if (topics != null) {
      map['topics'] = topics!.map((v) => v.toMap()).toList();
    }

    if (users != null) {
      map['users'] = users!.map((v) => v.toMap()).toList();
    }
    if (categories != null) {
      map['categories'] = categories!.map((v) => v.toMap()).toList();
    }

    return map;
  }

  factory CourseInformation.fromMap(Map<String, dynamic> map) {
    List<CourseTopic>? topics;
    if (map['topics'] != null) {
      topics = [];
      for (final v in map['topics'] as List) {
        topics.add(CourseTopic.fromMap(v as Map<String, dynamic>));
      }
    }

    List<UserInfo>? users;
    if (map['users'] != null) {
      users = [];
      for (final v in map['users'] as List) {
        users.add(UserInfo.fromMap(v as Map<String, dynamic>));
      }
    }

    List<CourseCategory>? categories;
    if (map['categories'] != null) {
      categories = [];
      for (final v in map['categories'] as List) {
        categories.add(CourseCategory.fromMap(v as Map<String, dynamic>));
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
      default_price: map['default_price'] as int?,
      course_price: map['course_price'] as int?,
      courseType: map['courseType'],
      sectionType: map['sectionType'],
      visible: map['visible'] as bool?,
      displayOrder: map['displayOrder'],
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      tutorCourse: map['TutorCourse'] != null
          ? TutorCourse.fromMap(map['TutorCourse'] as Map<String, dynamic>)
          : null,
      topics: topics,
      users: users,
      categories: categories,
    );
  }

//</editor-fold>
}
