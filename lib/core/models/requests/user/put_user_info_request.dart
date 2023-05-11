import 'package:flutter/foundation.dart';
import 'package:one_one_learn/core/models/requests/base_request.dart';

class PutUserInfoRequest extends BaseRequest {
  final String? birthday;
  final String? country;
  final String? level;
  final String? name;
  final String? studySchedule;
  final List<String> learnTopics;
  final List<String> testPreparations;

//<editor-fold desc="Data Methods">
  const PutUserInfoRequest({
    this.birthday,
    this.country,
    this.level,
    this.name,
    this.studySchedule,
    this.learnTopics = const [],
    this.testPreparations = const [],
  });

  factory PutUserInfoRequest.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return PutUserInfoRequest(
      birthday: mapJson['birthday'] as String?,
      country: mapJson['country'] as String?,
      level: mapJson['level'] as String?,
      name: mapJson['name'] as String?,
      studySchedule: mapJson['studySchedule'] as String?,
      learnTopics: mapJson['learnTopics'] != null
          ? (mapJson['learnTopics'] as List).map((e) => e.toString()).toList()
          : [],
      testPreparations: mapJson['testPreparations'] != null 
          ? (mapJson['testPreparations'] as List).map((e) => e.toString()).toList() 
          : [],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (birthday != null) {
      data['birthday'] = birthday;
    }
    if (country != null) {
      data['country'] = country;
    }
    if (level != null) {
      data['level'] = level;
    }
    if (name != null) {
      data['name'] = name;
    }
    if (studySchedule != null) {
      data['studySchedule'] = studySchedule;
    }
    data['learnTopics'] = learnTopics;
    data['testPreparations'] = testPreparations;
    return data;
  }

  @override
  List<Object?> get props => [
    birthday,
    country,
    level,
    name,
    studySchedule,
    learnTopics,
    testPreparations,
  ];

  @override
  String toString() {
    return 'PutUserInfoRequest{'
        ' birthday: $birthday,'
        ' country: $country,'
        ' level: $level,'
        ' name: $name,'
        ' studySchedule: $studySchedule,'
        ' learnTopics: $learnTopics,'
        ' testPreparations: $testPreparations,'
        ' }';
  }

  PutUserInfoRequest copyWith({
    String? birthday,
    String? country,
    String? level,
    String? name,
    String? studySchedule,
    List<String>? learnTopics,
    List<String>? testPreparations,
  }) {
    return PutUserInfoRequest(
      birthday: birthday ?? this.birthday,
      country: country ?? this.country,
      level: level ?? this.level,
      name: name ?? this.name,
      studySchedule: studySchedule ?? this.studySchedule,
      learnTopics: learnTopics ?? this.learnTopics,
      testPreparations: testPreparations ?? this.testPreparations,
    );
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is PutUserInfoRequest &&
          runtimeType == other.runtimeType &&
          birthday == other.birthday &&
          country == other.country &&
          level == other.level &&
          name == other.name &&
          studySchedule == other.studySchedule &&
          listEquals(learnTopics, other.learnTopics) &&
          listEquals(testPreparations, other.testPreparations);

  @override
  int get hashCode =>
      super.hashCode ^
      birthday.hashCode ^
      country.hashCode ^
      level.hashCode ^
      name.hashCode ^
      studySchedule.hashCode ^
      learnTopics.hashCode ^
      testPreparations.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'birthday': birthday,
      'country': country,
      'level': level,
      'name': name,
      'studySchedule': studySchedule,
      'learnTopics': learnTopics,
      'testPreparations': testPreparations,
    };
  }

  factory PutUserInfoRequest.fromMap(Map<String, dynamic> map) {
    return PutUserInfoRequest(
      birthday: map['birthday'] as String?,
      country: map['country'] as String?,
      level: map['level'] as String?,
      name: map['name'] as String?,
      studySchedule: map['studySchedule'] as String?,
      learnTopics: map['learnTopics'] != null
          ? (map['learnTopics'] as List).map((e) => e.toString()).toList()
          : [],
      testPreparations: map['testPreparations'] != null
          ? (map['testPreparations'] as List).map((e) => e.toString()).toList()
          : [],
    );
  }

//</editor-fold>
}
