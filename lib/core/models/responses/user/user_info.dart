
import 'package:flutter/foundation.dart';
import 'package:one_one_learn/core/models/responses/course/course_information.dart';
import 'package:one_one_learn/core/models/responses/tutor/tutor_info.dart';
import 'package:one_one_learn/core/models/responses/user/learn_topic.dart';
import 'package:one_one_learn/core/models/responses/user/referral_info.dart';
import 'package:one_one_learn/core/models/responses/user/test_preparation.dart';
import 'package:one_one_learn/core/models/responses/user/wallet_info.dart';

class UserInfo {
//<editor-fold desc="Data Methods">

  const UserInfo({
    this.id,
    this.email,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.roles,
    this.language,
    this.birthday,
    this.isActivated,
    this.tutorInfo,
    this.walletInfo,
    this.courses,
    this.requireNote,
    this.level,
    this.learnTopics,
    this.testPreparations,
    this.isPhoneActivated,
    this.timezone,
    this.referralInfo,
    this.studySchedule,
    this.canSendMessage,
    this.studentGroup,
    this.studentInfo,
    this.avgRating,
  });

  factory UserInfo.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;

    var roles = <String>[];
    if (mapJson['roles'] != null) {
      roles = [];
      for (final role in mapJson['roles'] as List<dynamic>) {
        roles.add(role.toString());
      }
    }

    List<CourseInformation>? courses;
    if (mapJson['courses'] != null) {
      courses = [];
      for (final v in mapJson['courses'] as List) {
        courses.add(CourseInformation.fromJson(v));
      }
    }

    List<LearnTopic>? learnTopics;
    if (mapJson['learnTopics'] != null) {
      learnTopics = [];
      for (final v in mapJson['learnTopics'] as List) {
        learnTopics.add(LearnTopic.fromJson(v));
      }
    }

    List<TestPreparation>? testPreparations;
    if (mapJson['testPreparations'] != null) {
      testPreparations = <TestPreparation>[];
      for (final v in mapJson['testPreparations'] as List) {
        testPreparations.add(TestPreparation.fromJson(v));
      }
    }

    return UserInfo(
      id: json['id'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      roles: roles,
      language: json['language'] as String?,
      birthday:json['birthday'] as String?,
      isActivated: json['isActivated'] as bool?,
      tutorInfo: json['tutorInfo'] != null ? TutorInfo.fromJson(json['tutorInfo']) : null,
      walletInfo: json['walletInfo'] != null ? WalletInfo.fromJson(json['walletInfo']) : null,
      courses: courses,
      requireNote: json['requireNote'] as String?,
      level: json['level'] as String?,
      learnTopics: learnTopics,
      testPreparations: testPreparations,
      isPhoneActivated: json['isPhoneActivated'] as bool?,
      timezone: json['timezone'] as num?,
      referralInfo: json['referralInfo'] != null ? ReferralInfo.fromJson(json['referralInfo']) : null,
      studySchedule: json['studySchedule'] as String?,
      canSendMessage: json['canSendMessage'] as bool?,
      studentGroup: json['studentGroup'] as String?,
      studentInfo: json['studentInfo'] as String?,
      avgRating: json['avgRating'] as num?,
    );
  }

  final String? id;
  final String? email;
  final String? name;
  final String? avatar;
  final String? country;
  final String? phone;
  final List<String>? roles;
  final String? language;
  final String? birthday;
  final bool? isActivated;
  final TutorInfo? tutorInfo;
  final WalletInfo? walletInfo;
  final List<CourseInformation>? courses;
  final String? requireNote;
  final String? level;
  final List<LearnTopic>? learnTopics;
  final List<TestPreparation>? testPreparations;
  final bool? isPhoneActivated;
  final num? timezone;
  final ReferralInfo? referralInfo;
  final String? studySchedule;
  final bool? canSendMessage;
  final dynamic studentGroup;
  final dynamic studentInfo;
  final num? avgRating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['name'] = name;
    map['avatar'] = avatar;
    map['country'] = country;
    map['phone'] = phone;
    map['roles'] = roles;
    map['language'] = language;
    map['birthday'] = birthday;
    map['isActivated'] = isActivated;
    if (tutorInfo != null) {
      map['tutorInfo'] = tutorInfo?.toJson();
    }
    if (walletInfo != null) {
      map['walletInfo'] = walletInfo?.toJson();
    }
    if (courses != null) {
      map['courses'] = courses?.map((v) => v.toJson()).toList();
    }
    map['requireNote'] = requireNote;
    map['level'] = level;
    if (learnTopics != null) {
      map['learnTopics'] = learnTopics?.map((v) => v.toJson()).toList();
    }
    if (testPreparations != null) {
      map['testPreparations'] = testPreparations?.map((v) => v.toJson()).toList();
    }
    map['isPhoneActivated'] = isPhoneActivated;
    map['timezone'] = timezone;
    if (referralInfo != null) {
      map['referralInfo'] = referralInfo?.toJson();
    }
    map['studySchedule'] = studySchedule;
    map['canSendMessage'] = canSendMessage;
    map['studentGroup'] = studentGroup;
    map['studentInfo'] = studentInfo;
    map['avgRating'] = avgRating;
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserInfo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email &&
          name == other.name &&
          avatar == other.avatar &&
          country == other.country &&
          phone == other.phone &&
          listEquals(roles, other.roles) &&
          language == other.language &&
          birthday == other.birthday &&
          isActivated == other.isActivated &&
          tutorInfo == other.tutorInfo &&
          walletInfo == other.walletInfo &&
          listEquals(courses, other.courses) &&
          requireNote == other.requireNote &&
          level == other.level &&
          listEquals(learnTopics, other.learnTopics) &&
          listEquals(testPreparations, other.testPreparations) &&
          isPhoneActivated == other.isPhoneActivated &&
          timezone == other.timezone &&
          referralInfo == other.referralInfo &&
          studySchedule == other.studySchedule &&
          canSendMessage == other.canSendMessage &&
          studentGroup == other.studentGroup &&
          studentInfo == other.studentInfo &&
          avgRating == other.avgRating);

  @override
  int get hashCode =>
      id.hashCode ^
      email.hashCode ^
      name.hashCode ^
      avatar.hashCode ^
      country.hashCode ^
      phone.hashCode ^
      roles.hashCode ^
      language.hashCode ^
      birthday.hashCode ^
      isActivated.hashCode ^
      tutorInfo.hashCode ^
      walletInfo.hashCode ^
      courses.hashCode ^
      requireNote.hashCode ^
      level.hashCode ^
      learnTopics.hashCode ^
      testPreparations.hashCode ^
      isPhoneActivated.hashCode ^
      timezone.hashCode ^
      referralInfo.hashCode ^
      studySchedule.hashCode ^
      canSendMessage.hashCode ^
      studentGroup.hashCode ^
      studentInfo.hashCode ^
      avgRating.hashCode;

  @override
  String toString() {
    return 'UserInfoResponse{'
        ' id: $id,'
        ' email: $email,'
        ' name: $name,'
        ' avatar: $avatar,'
        ' country: $country,'
        ' phone: $phone,'
        ' roles: $roles,'
        ' language: $language,'
        ' birthday: $birthday,'
        ' isActivated: $isActivated,'
        ' tutorInfo: $tutorInfo,'
        ' walletInfo: $walletInfo,'
        ' courses: $courses,'
        ' requireNote: $requireNote,'
        ' level: $level,'
        ' learnTopics: $learnTopics,'
        ' testPreparations: $testPreparations,'
        ' isPhoneActivated: $isPhoneActivated,'
        ' timezone: $timezone,'
        ' referralInfo: $referralInfo,'
        ' studySchedule: $studySchedule,'
        ' canSendMessage: $canSendMessage,'
        ' studentGroup: $studentGroup,'
        ' studentInfo: $studentInfo,'
        ' avgRating: $avgRating,'
        ' }';
  }

  UserInfo copyWith({
    String? id,
    String? email,
    String? name,
    String? avatar,
    String? country,
    String? phone,
    List<String>? roles,
    String? language,
    String? birthday,
    bool? isActivated,
    TutorInfo? tutorInfo,
    WalletInfo? walletInfo,
    List<CourseInformation>? courses,
    String? requireNote,
    String? level,
    List<LearnTopic>? learnTopics,
    List<TestPreparation>? testPreparations,
    bool? isPhoneActivated,
    num? timezone,
    ReferralInfo? referralInfo,
    String? studySchedule,
    bool? canSendMessage,
    dynamic studentGroup,
    dynamic studentInfo,
    num? avgRating,
  }) {
    return UserInfo(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      country: country ?? this.country,
      phone: phone ?? this.phone,
      roles: roles ?? this.roles,
      language: language ?? this.language,
      birthday: birthday ?? this.birthday,
      isActivated: isActivated ?? this.isActivated,
      tutorInfo: tutorInfo ?? this.tutorInfo,
      walletInfo: walletInfo ?? this.walletInfo,
      courses: courses ?? this.courses,
      requireNote: requireNote ?? this.requireNote,
      level: level ?? this.level,
      learnTopics: learnTopics ?? this.learnTopics,
      testPreparations: testPreparations ?? this.testPreparations,
      isPhoneActivated: isPhoneActivated ?? this.isPhoneActivated,
      timezone: timezone ?? this.timezone,
      referralInfo: referralInfo ?? this.referralInfo,
      studySchedule: studySchedule ?? this.studySchedule,
      canSendMessage: canSendMessage ?? this.canSendMessage,
      studentGroup: studentGroup ?? this.studentGroup,
      studentInfo: studentInfo ?? this.studentInfo,
      avgRating: avgRating ?? this.avgRating,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['name'] = name;
    map['avatar'] = avatar;
    map['country'] = country;
    map['phone'] = phone;
    map['roles'] = roles;
    map['language'] = language;
    map['birthday'] = birthday;
    map['isActivated'] = isActivated;
    if (tutorInfo != null) {
      map['tutorInfo'] = tutorInfo?.toMap();
    }
    if (walletInfo != null) {
      map['walletInfo'] = walletInfo?.toMap();
    }
    if (courses != null) {
      map['courses'] = courses?.map((v) => v.toMap()).toList();
    }
    map['requireNote'] = requireNote;
    map['level'] = level;
    if (learnTopics != null) {
      map['learnTopics'] = learnTopics?.map((v) => v.toMap()).toList();
    }
    if (testPreparations != null) {
      map['testPreparations'] = testPreparations?.map((v) => v.toJson()).toList();
    }
    map['isPhoneActivated'] = isPhoneActivated;
    map['timezone'] = timezone;
    if (referralInfo != null) {
      map['referralInfo'] = referralInfo?.toMap();
    }
    map['studySchedule'] = studySchedule;
    map['canSendMessage'] = canSendMessage;
    map['studentGroup'] = studentGroup;
    map['studentInfo'] = studentInfo;
    map['avgRating'] = avgRating;
    return map;
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    var roles = <String>[];
    if (map['roles'] != null) {
      roles = [];
      for (final role in map['roles'] as List<dynamic>) {
        roles.add(role.toString());
      }
    }

    List<CourseInformation>? courses;
    if (map['courses'] != null) {
      courses = <CourseInformation>[];
      for (final v in map['courses'] as List<dynamic>) {
        courses.add(CourseInformation.fromMap(v as Map<String, dynamic>));
      }
    }

    List<LearnTopic>? learnTopics;
    if (map['learnTopics'] != null) {
      learnTopics = [];
      for (final v in map['learnTopics'] as List) {
        learnTopics.add(LearnTopic.fromMap(v as Map<String, dynamic>));
      }
    }

    List<TestPreparation>? testPreparations;
    if (map['testPreparations'] != null) {
      testPreparations = <TestPreparation>[];
      for (final v in map['testPreparations'] as List) {
        testPreparations.add(TestPreparation.fromMap(v as Map<String, dynamic>));
      }
    }

    return UserInfo(
      id: map['id'] as String?,
      email: map['email'] as String?,
      name: map['name'] as String?,
      avatar: map['avatar'] as String?,
      country: map['country'] as String?,
      phone: map['phone'] as String?,
      roles: roles,
      language: map['language'] as String?,
      birthday:map['birthday'] as String?,
      isActivated: map['isActivated'] as bool?,
      tutorInfo: map['tutorInfo'] != null ? TutorInfo.fromMap(
        map['tutorInfo'] as Map<String, dynamic>,
      ) : null,
      walletInfo: map['walletInfo'] != null ? WalletInfo.fromMap(
        map['walletInfo'] as Map<String, dynamic>,
      ) : null,
      courses: courses,
      requireNote: map['requireNote'] as String?,
      level: map['level'] as String?,
      learnTopics: learnTopics,
      testPreparations: testPreparations,
      isPhoneActivated: map['isPhoneActivated'] as bool?,
      timezone: map['timezone'] as num?,
      referralInfo: map['referralInfo'] != null ? ReferralInfo.fromMap(
        map['referralInfo'] as Map<String, dynamic>,
      ) : null,
      studySchedule: map['studySchedule'] as String?,
      canSendMessage: map['canSendMessage'] as bool?,
      studentGroup: map['studentGroup'] as String?,
      studentInfo: map['studentInfo'] as String?,
      avgRating: map['avgRating'] as num?,
    );
  }

//</editor-fold>
}
