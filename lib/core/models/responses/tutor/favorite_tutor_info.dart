import 'package:one_one_learn/core/models/responses/tutor/tutor_info.dart';

/// id : "c764a3a9-c0dc-443f-bfac-13939e4eb21a"
/// firstId : "f569c202-7bbf-4620-af77-ecc1419a6b28"
/// secondId : "45f8709e-2e84-46f2-b238-817a85cc2b29"
/// createdAt : "2023-04-22T14:39:41.060Z"
/// updatedAt : "2023-04-22T14:39:41.060Z"
/// secondInfo : {"id":"45f8709e-2e84-46f2-b238-817a85cc2b29","level":"INTERMEDIATE","email":"teacher+2@lettutor.com","google":null,"facebook":null,"apple":null,"avatar":"https://api.app.lettutor.com/avatar/e9e3eeaa-a588-47c4-b4d1-ecfa190f63faavatar1632109929661.jpg","name":"Jill Leano","country":"PH","phone":"1800 8168 ","language":null,"birthday":"1934-08-18","requestPassword":false,"isActivated":true,"isPhoneActivated":null,"requireNote":null,"timezone":7,"phoneAuth":null,"isPhoneAuthActivated":false,"studySchedule":null,"canSendMessage":false,"isPublicRecord":false,"caredByStaffId":null,"createdAt":"2021-08-15T08:11:20.783Z","updatedAt":"2022-01-23T10:18:32.083Z","deletedAt":null,"studentGroupId":null,"tutorInfo":{"id":"4e14c8e0-fcd5-4746-8004-8d771fe97143","userId":"45f8709e-2e84-46f2-b238-817a85cc2b29","video":"https://api.app.lettutor.com/video/e9e3eeaa-a588-47c4-b4d1-ecfa190f63favideo1632109929663.mp4","bio":"Hi, My name is Jill I am an experienced English Teacher from Philippine. I would like to share my enthusiasm with the learners in this platform. I've been working with diverse learners of all levels for many years. I am greatly passionate about about profession. I love teaching because I can help others improve their skills and it gives me joy and excitement meeting different learners around the world. In my class I worked with wonderful enthusiasm and positivity, and I'm happy to focus on my learner's goal.","education":"Certified at English education","experience":"5 years in education","profession":"English Teacher","accent":null,"targetStudent":"Beginner","interests":"English, Japansese","languages":"en","specialties":"business-english,english-for-kids,toefl,toeic","resume":null,"rating":null,"isActivated":true,"isNative":null,"createdAt":"2021-08-15T08:19:49.488Z","updatedAt":"2022-01-03T14:40:41.455Z"}}
class FavoriteTutorInfo {

//<editor-fold desc="Data Methods">
  FavoriteTutorInfo({
    this.id,
    this.firstId,
    this.secondId,
    this.createdAt,
    this.updatedAt,
    this.secondInfo,
  });

  FavoriteTutorInfo.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    id = mapJson['id'] as String?;
    firstId = mapJson['firstId'] as String?;
    secondId = mapJson['secondId'] as String?;
    createdAt = mapJson['createdAt'] as String?;
    updatedAt = mapJson['updatedAt'] as String?;
    secondInfo = mapJson['secondInfo'] != null ? SecondInfo.fromJson(mapJson['secondInfo']) : null;
  }

  String? id;
  String? firstId;
  String? secondId;
  String? createdAt;
  String? updatedAt;
  SecondInfo? secondInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    if (firstId != null) {
      map['firstId'] = firstId;
    }
    if (secondId != null) {
      map['secondId'] = secondId;
    }
    if (createdAt != null) {
      map['createdAt'] = createdAt;
    }
    if (updatedAt != null) {
      map['updatedAt'] = updatedAt;
    }
    if (secondInfo != null) {
      map['secondInfo'] = secondInfo?.toJson();
    }
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteTutorInfo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          firstId == other.firstId &&
          secondId == other.secondId &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          secondInfo == other.secondInfo);

  @override
  int get hashCode =>
      id.hashCode ^
      firstId.hashCode ^
      secondId.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      secondInfo.hashCode;

  @override
  String toString() {
    return 'FavoriteTutorInfo{'
        ' id: $id,'
        ' firstId: $firstId,'
        ' secondId: $secondId,'
        ' createdAt: $createdAt,'
        ' updatedAt: $updatedAt,'
        ' secondInfo: $secondInfo,'
        ' }';
  }

  FavoriteTutorInfo copyWith({
    String? id,
    String? firstId,
    String? secondId,
    String? createdAt,
    String? updatedAt,
    SecondInfo? secondInfo,
  }) {
    return FavoriteTutorInfo(
      id: id ?? this.id,
      firstId: firstId ?? this.firstId,
      secondId: secondId ?? this.secondId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      secondInfo: secondInfo ?? this.secondInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstId': firstId,
      'secondId': secondId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'secondInfo': secondInfo?.toMap(),
    };
  }

  factory FavoriteTutorInfo.fromMap(Map<String, dynamic> map) {
    return FavoriteTutorInfo(
      id: map['id'] as String,
      firstId: map['firstId'] as String?,
      secondId: map['secondId'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      secondInfo: map['secondInfo'] != null
          ? SecondInfo.fromMap(map['secondInfo'] as Map<String, dynamic>)
          : null,
    );
  }

//</editor-fold>
}

/// id : "45f8709e-2e84-46f2-b238-817a85cc2b29"
/// level : "INTERMEDIATE"
/// email : "teacher+2@lettutor.com"
/// google : null
/// facebook : null
/// apple : null
/// avatar : "https://api.app.lettutor.com/avatar/e9e3eeaa-a588-47c4-b4d1-ecfa190f63faavatar1632109929661.jpg"
/// name : "Jill Leano"
/// country : "PH"
/// phone : "1800 8168 "
/// language : null
/// birthday : "1934-08-18"
/// requestPassword : false
/// isActivated : true
/// isPhoneActivated : null
/// requireNote : null
/// timezone : 7
/// phoneAuth : null
/// isPhoneAuthActivated : false
/// studySchedule : null
/// canSendMessage : false
/// isPublicRecord : false
/// caredByStaffId : null
/// createdAt : "2021-08-15T08:11:20.783Z"
/// updatedAt : "2022-01-23T10:18:32.083Z"
/// deletedAt : null
/// studentGroupId : null
/// tutorInfo : {"id":"4e14c8e0-fcd5-4746-8004-8d771fe97143","userId":"45f8709e-2e84-46f2-b238-817a85cc2b29","video":"https://api.app.lettutor.com/video/e9e3eeaa-a588-47c4-b4d1-ecfa190f63favideo1632109929663.mp4","bio":"Hi, My name is Jill I am an experienced English Teacher from Philippine. I would like to share my enthusiasm with the learners in this platform. I've been working with diverse learners of all levels for many years. I am greatly passionate about about profession. I love teaching because I can help others improve their skills and it gives me joy and excitement meeting different learners around the world. In my class I worked with wonderful enthusiasm and positivity, and I'm happy to focus on my learner's goal.","education":"Certified at English education","experience":"5 years in education","profession":"English Teacher","accent":null,"targetStudent":"Beginner","interests":"English, Japansese","languages":"en","specialties":"business-english,english-for-kids,toefl,toeic","resume":null,"rating":null,"isActivated":true,"isNative":null,"createdAt":"2021-08-15T08:19:49.488Z","updatedAt":"2022-01-03T14:40:41.455Z"}
class SecondInfo {

//<editor-fold desc="Data Methods">
  SecondInfo({
    this.id,
    this.level,
    this.email,
    this.google,
    this.facebook,
    this.apple,
    this.avatar,
    this.name,
    this.country,
    this.phone,
    this.language,
    this.birthday,
    this.requestPassword,
    this.isActivated,
    required this.isPhoneActivated,
    required this.requireNote,
    this.timezone,
    required this.phoneAuth,
    this.isPhoneAuthActivated,
    this.studySchedule,
    this.canSendMessage,
    this.isPublicRecord,
    required this.caredByStaffId,
    this.createdAt,
    this.updatedAt,
    required this.deletedAt,
    required this.studentGroupId,
    this.tutorInfo,
  });

  SecondInfo.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    id = mapJson['id'] as String?;
    level = mapJson['level'] as String?;
    email = mapJson['email'] as String?;
    google = mapJson['google'] as String?;
    facebook = mapJson['facebook'] as String?;
    apple = mapJson['apple'] as String?;
    avatar = mapJson['avatar'] as String?;
    name = mapJson['name'] as String?;
    country = mapJson['country'] as String?;
    phone = mapJson['phone'] as String?;
    language = mapJson['language'] as String?;
    birthday = mapJson['birthday'] as String?;
    requestPassword = mapJson['requestPassword'] as bool?;
    isActivated = mapJson['isActivated'] as bool?;
    isPhoneActivated = mapJson['isPhoneActivated'];
    requireNote = mapJson['requireNote'];
    timezone = mapJson['timezone'] as num?;
    phoneAuth = mapJson['phoneAuth'];
    isPhoneAuthActivated = mapJson['isPhoneAuthActivated'] as bool?;
    studySchedule = mapJson['studySchedule'] as String?;
    canSendMessage = mapJson['canSendMessage'] as bool?;
    isPublicRecord = mapJson['isPublicRecord'] as bool?;
    caredByStaffId = mapJson['caredByStaffId'] as String?;
    createdAt = mapJson['createdAt'] as String?;
    updatedAt = mapJson['updatedAt'] as String?;
    deletedAt = mapJson['deletedAt'];
    studentGroupId = json['studentGroupId'];
    tutorInfo = mapJson['tutorInfo'] != null ? TutorInfo.fromJson(mapJson['tutorInfo']) : null;
  }

  String? id;
  String? level;
  String? email;
  String? google;
  String? facebook;
  String? apple;
  String? avatar;
  String? name;
  String? country;
  String? phone;
  String? language;
  String? birthday;
  bool? requestPassword;
  bool? isActivated;
  dynamic isPhoneActivated;
  dynamic requireNote;
  num? timezone;
  dynamic phoneAuth;
  bool? isPhoneAuthActivated;
  String? studySchedule;
  bool? canSendMessage;
  bool? isPublicRecord;
  dynamic caredByStaffId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic studentGroupId;
  TutorInfo? tutorInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    if (level != null) {
      map['level'] = level;
    }
    if (email != null) {
      map['email'] = email;
    }
    if (google != null) {
      map['google'] = google;
    }
    if (facebook != null) {
      map['facebook'] = facebook;
    }
    if (apple != null) {
      map['apple'] = apple;
    }
    if (avatar != null) {
      map['avatar'] = avatar;
    }
    if (name != null) {
      map['name'] = name;
    }
    if (country != null) {
      map['country'] = country;
    }
    if (phone != null) {
      map['phone'] = phone;
    }
    if (language != null) {
      map['language'] = language;
    }
    if (birthday != null) {
      map['birthday'] = birthday;
    }
    if (requestPassword != null) {
      map['requestPassword'] = requestPassword;
    }
    if (isActivated != null) {
      map['isActivated'] = isActivated;
    }
    if (isPhoneActivated != null) {
      map['isPhoneActivated'] = isPhoneActivated;
    }
    if (requireNote != null) {
      map['requireNote'] = requireNote;
    }
    if (timezone != null) {
      map['timezone'] = timezone;
    }
    if (phoneAuth != null) {
      map['phoneAuth'] = phoneAuth;
    }
    if (isPhoneAuthActivated != null) {
      map['isPhoneAuthActivated'] = isPhoneAuthActivated;
    }
    if (studySchedule != null) {
      map['studySchedule'] = studySchedule;
    }
    if (canSendMessage != null) {
      map['canSendMessage'] = canSendMessage;
    }
    if (isPublicRecord != null) {
      map['isPublicRecord'] = isPublicRecord;
    }
    if (caredByStaffId != null) {
      map['caredByStaffId'] = caredByStaffId;
    }
    if (createdAt != null) {
      map['createdAt'] = createdAt;
    }
    if (updatedAt != null) {
      map['updatedAt'] = updatedAt;
    }
    if (deletedAt != null) {
      map['deletedAt'] = deletedAt;
    }
    if (studentGroupId != null) {
      map['studentGroupId'] = studentGroupId;
    }
    if (tutorInfo != null) {
      map['tutorInfo'] = tutorInfo?.toJson();
    }
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SecondInfo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          level == other.level &&
          email == other.email &&
          google == other.google &&
          facebook == other.facebook &&
          apple == other.apple &&
          avatar == other.avatar &&
          name == other.name &&
          country == other.country &&
          phone == other.phone &&
          language == other.language &&
          birthday == other.birthday &&
          requestPassword == other.requestPassword &&
          isActivated == other.isActivated &&
          isPhoneActivated == other.isPhoneActivated &&
          requireNote == other.requireNote &&
          timezone == other.timezone &&
          phoneAuth == other.phoneAuth &&
          isPhoneAuthActivated == other.isPhoneAuthActivated &&
          studySchedule == other.studySchedule &&
          canSendMessage == other.canSendMessage &&
          isPublicRecord == other.isPublicRecord &&
          caredByStaffId == other.caredByStaffId &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          deletedAt == other.deletedAt &&
          studentGroupId == other.studentGroupId &&
          tutorInfo == other.tutorInfo);

  @override
  int get hashCode =>
      id.hashCode ^
      level.hashCode ^
      email.hashCode ^
      google.hashCode ^
      facebook.hashCode ^
      apple.hashCode ^
      avatar.hashCode ^
      name.hashCode ^
      country.hashCode ^
      phone.hashCode ^
      language.hashCode ^
      birthday.hashCode ^
      requestPassword.hashCode ^
      isActivated.hashCode ^
      isPhoneActivated.hashCode ^
      requireNote.hashCode ^
      timezone.hashCode ^
      phoneAuth.hashCode ^
      isPhoneAuthActivated.hashCode ^
      studySchedule.hashCode ^
      canSendMessage.hashCode ^
      isPublicRecord.hashCode ^
      caredByStaffId.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      deletedAt.hashCode ^
      studentGroupId.hashCode ^
      tutorInfo.hashCode;

  @override
  String toString() {
    return 'SecondInfo{'
        ' id: $id,'
        ' level: $level,'
        ' email: $email,'
        ' google: $google,'
        ' facebook: $facebook,'
        ' apple: $apple,'
        ' avatar: $avatar,'
        ' name: $name,'
        ' country: $country,'
        ' phone: $phone,'
        ' language: $language,'
        ' birthday: $birthday,'
        ' requestPassword: $requestPassword,'
        ' isActivated: $isActivated,'
        ' isPhoneActivated: $isPhoneActivated,'
        ' requireNote: $requireNote,'
        ' timezone: $timezone,'
        ' phoneAuth: $phoneAuth,'
        ' isPhoneAuthActivated: $isPhoneAuthActivated,'
        ' studySchedule: $studySchedule,'
        ' canSendMessage: $canSendMessage,'
        ' isPublicRecord: $isPublicRecord,'
        ' caredByStaffId: $caredByStaffId,'
        ' createdAt: $createdAt,'
        ' updatedAt: $updatedAt,'
        ' deletedAt: $deletedAt,'
        ' studentGroupId: $studentGroupId,'
        ' tutorInfo: $tutorInfo,'
        ' }';
  }

  SecondInfo copyWith({
    String? id,
    String? level,
    String? email,
    String? google,
    String? facebook,
    String? apple,
    String? avatar,
    String? name,
    String? country,
    String? phone,
    String? language,
    String? birthday,
    bool? requestPassword,
    bool? isActivated,
    dynamic? isPhoneActivated,
    dynamic? requireNote,
    num? timezone,
    dynamic? phoneAuth,
    bool? isPhoneAuthActivated,
    String? studySchedule,
    bool? canSendMessage,
    bool? isPublicRecord,
    dynamic? caredByStaffId,
    String? createdAt,
    String? updatedAt,
    dynamic? deletedAt,
    dynamic? studentGroupId,
    TutorInfo? tutorInfo,
  }) {
    return SecondInfo(
      id: id ?? this.id,
      level: level ?? this.level,
      email: email ?? this.email,
      google: google ?? this.google,
      facebook: facebook ?? this.facebook,
      apple: apple ?? this.apple,
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
      country: country ?? this.country,
      phone: phone ?? this.phone,
      language: language ?? this.language,
      birthday: birthday ?? this.birthday,
      requestPassword: requestPassword ?? this.requestPassword,
      isActivated: isActivated ?? this.isActivated,
      isPhoneActivated: isPhoneActivated ?? this.isPhoneActivated,
      requireNote: requireNote ?? this.requireNote,
      timezone: timezone ?? this.timezone,
      phoneAuth: phoneAuth ?? this.phoneAuth,
      isPhoneAuthActivated: isPhoneAuthActivated ?? this.isPhoneAuthActivated,
      studySchedule: studySchedule ?? this.studySchedule,
      canSendMessage: canSendMessage ?? this.canSendMessage,
      isPublicRecord: isPublicRecord ?? this.isPublicRecord,
      caredByStaffId: caredByStaffId ?? this.caredByStaffId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      studentGroupId: studentGroupId ?? this.studentGroupId,
      tutorInfo: tutorInfo ?? this.tutorInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'level': level,
      'email': email,
      'google': google,
      'facebook': facebook,
      'apple': apple,
      'avatar': avatar,
      'name': name,
      'country': country,
      'phone': phone,
      'language': language,
      'birthday': birthday,
      'requestPassword': requestPassword,
      'isActivated': isActivated,
      'isPhoneActivated': isPhoneActivated,
      'requireNote': requireNote,
      'timezone': timezone,
      'phoneAuth': phoneAuth,
      'isPhoneAuthActivated': isPhoneAuthActivated,
      'studySchedule': studySchedule,
      'canSendMessage': canSendMessage,
      'isPublicRecord': isPublicRecord,
      'caredByStaffId': caredByStaffId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'studentGroupId': studentGroupId,
      'tutorInfo': tutorInfo?.toMap(),
    };
  }

  factory SecondInfo.fromMap(Map<String, dynamic> map) {
    return SecondInfo(
      id: map['id'] as String?,
      level: map['level'] as String?,
      email: map['email'] as String?,
      google: map['google'] as String?,
      facebook: map['facebook'] as String?,
      apple: map['apple'] as String?,
      avatar: map['avatar'] as String?,
      name: map['name'] as String?,
      country: map['country'] as String?,
      phone: map['phone'] as String?,
      language: map['language'] as String?,
      birthday: map['birthday'] as String?,
      requestPassword: map['requestPassword'] as bool?,
      isActivated: map['isActivated'] as bool?,
      isPhoneActivated: map['isPhoneActivated'] as dynamic,
      requireNote: map['requireNote'] as dynamic,
      timezone: map['timezone'] as num?,
      phoneAuth: map['phoneAuth'] as dynamic,
      isPhoneAuthActivated: map['isPhoneAuthActivated'] as bool?,
      studySchedule: map['studySchedule'] as String?,
      canSendMessage: map['canSendMessage'] as bool?,
      isPublicRecord: map['isPublicRecord'] as bool?,
      caredByStaffId: map['caredByStaffId'] as dynamic,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as dynamic,
      studentGroupId: map['studentGroupId'] as dynamic,
      tutorInfo: map['tutorInfo'] != null
          ? TutorInfo.fromMap(map['tutorInfo'] as Map<String, dynamic>)
          : null
    );
  }

//</editor-fold>
}
