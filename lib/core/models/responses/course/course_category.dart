/// id : "488cc5f8-a5b1-45cd-8d3a-47e690f9298e"
/// title : "English for Beginners"
/// description : null
/// key : "BEGINNER"
/// displayOrder : null
/// createdAt : "2021-09-05T13:06:10.836Z"
/// updatedAt : "2021-09-05T13:06:10.836Z"
class CourseCategory {

//<editor-fold desc="Data Methods">
  CourseCategory({
    this.id,
    this.title,
    required this.description,
    this.key,
    required this.displayOrder,
    this.createdAt,
    this.updatedAt,
  });

  CourseCategory.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    id = mapJson['id'] as String?;
    title = mapJson['title'] as String?;
    description = mapJson['description'];
    key = mapJson['key'] as String?;
    displayOrder = mapJson['displayOrder'] as String?;
    createdAt = mapJson['createdAt'] as String?;
    updatedAt = mapJson['updatedAt'] as String?;
  }
  String? id;
  String? title;
  dynamic description;
  String? key;
  dynamic displayOrder;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    if (title != null) {
      map['title'] = title;
    }
    if (description != null) {
      map['description'] = description;
    }
    if (key != null) {
      map['key'] = key;
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
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseCategory &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          key == other.key &&
          displayOrder == other.displayOrder &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt);

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      key.hashCode ^
      displayOrder.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;

  @override
  String toString() {
    return 'CourseCategory{'
        ' id: $id,'
        ' title: $title,'
        ' description: $description,'
        ' key: $key,'
        ' displayOrder: $displayOrder,'
        ' createdAt: $createdAt,'
        ' updatedAt: $updatedAt,'
        ' }';
  }

  CourseCategory copyWith({
    String? id,
    String? title,
    dynamic? description,
    String? key,
    dynamic? displayOrder,
    String? createdAt,
    String? updatedAt,
  }) {
    return CourseCategory(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      key: key ?? this.key,
      displayOrder: displayOrder ?? this.displayOrder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'key': key,
      'displayOrder': displayOrder,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory CourseCategory.fromMap(Map<String, dynamic> map) {
    return CourseCategory(
      id: map['id'] as String?,
      title: map['title'] as String?,
      description: map['description'] as dynamic,
      key: map['key'] as String?,
      displayOrder: map['displayOrder'] as dynamic,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
    );
  }

//</editor-fold>
}