class CourseTopic {
  final String? id;
  final String? courseId;
  final int? orderCourse;
  final String? name;
  final String? nameFile;
  final String? description;
  final String? createdAt;
  final String? updatedAt;

//<editor-fold desc="Data Methods">
  const CourseTopic({
    this.id,
    this.courseId,
    this.orderCourse,
    this.name,
    this.nameFile,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory CourseTopic.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return CourseTopic(
      id: mapJson['id'] as String?,
      courseId: mapJson['courseId'] as String?,
      createdAt: mapJson['createdAt'] as String?,
      updatedAt: mapJson['updatedAt'] as String?,
      description: mapJson['description'] as String?,
      name: mapJson['name'] as String?,
      nameFile: mapJson['nameFile'] as String?,
      orderCourse: mapJson['orderCourse'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['courseId'] = courseId;
    map['orderCourse'] = orderCourse;
    map['name'] = name;
    map['nameFile'] = nameFile;
    map['description'] = description;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

  @override
  String toString() {
    return 'CourseTopic{'
        ' id: $id,'
        ' courseId: $courseId,'
        ' orderCourse: $orderCourse,'
        ' name: $name,'
        ' nameFile: $nameFile,'
        ' description: $description,'
        ' createdAt: $createdAt,'
        ' updatedAt: $updatedAt,'
        ' }';
  }

  CourseTopic copyWith({
    String? id,
    String? courseId,
    int? orderCourse,
    String? name,
    String? nameFile,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) {
    return CourseTopic(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      orderCourse: orderCourse ?? this.orderCourse,
      name: name ?? this.name,
      nameFile: nameFile ?? this.nameFile,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'courseId': courseId,
      'orderCourse': orderCourse,
      'name': name,
      'nameFile': nameFile,
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory CourseTopic.fromMap(Map<String, dynamic> map) {
    return CourseTopic(
      id: map['id'] as String?,
      courseId: map['courseId'] as String?,
      orderCourse: map['orderCourse'] as int?,
      name: map['name'] as String?,
      nameFile: map['nameFile'] as String?,
      description: map['description'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
    );
  }

//</editor-fold>
}
