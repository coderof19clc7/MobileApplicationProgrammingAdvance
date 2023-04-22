/// UserId : "f569c202-7bbf-4620-af77-ecc1419a6b28"
/// CourseId : "3476c86d-6d8c-46c9-aedd-a116a5891acb"
/// createdAt : "2023-04-13T12:39:50.892Z"
/// updatedAt : "2023-04-13T12:39:50.892Z"
class TutorCourse {

//<editor-fold desc="Data Methods">
  TutorCourse({
    this.userId,
    this.courseId,
    this.createdAt,
    this.updatedAt,
  });

  TutorCourse.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    userId = mapJson['UserId'] as String?;
    courseId = mapJson['CourseId'] as String?;
    createdAt = mapJson['createdAt'] as String?;
    updatedAt = mapJson['updatedAt'] as String?;
  }

  String? userId;
  String? courseId;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (userId != null) {
      map['UserId'] = userId;
    }
    if (courseId != null) {
      map['CourseId'] = courseId;
    }
    if (createdAt != null) {
      map['createdAt'] = createdAt;
    }
    if (updatedAt != null) {
      map['updatedAt'] = updatedAt;
    }
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TutorCourse &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          courseId == other.courseId &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt);

  @override
  int get hashCode =>
      userId.hashCode ^
      courseId.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;

  @override
  String toString() {
    return 'TutorCourse{'
        ' userId: $userId,'
        ' courseId: $courseId,'
        ' createdAt: $createdAt,'
        ' updatedAt: $updatedAt,'
        ' }';
  }

  TutorCourse copyWith({
    String? userId,
    String? courseId,
    String? createdAt,
    String? updatedAt,
  }) {
    return TutorCourse(
      userId: userId ?? this.userId,
      courseId: courseId ?? this.courseId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'courseId': courseId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory TutorCourse.fromMap(Map<String, dynamic> map) {
    return TutorCourse(
      userId: map['userId'] as String?,
      courseId: map['courseId'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
    );
  }

//</editor-fold>
}
