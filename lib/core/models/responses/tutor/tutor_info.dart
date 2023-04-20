import 'package:one_one_learn/core/models/responses/tutor/feed_back.dart';
import 'package:one_one_learn/core/models/responses/user/user_info.dart';

/// level : "PROFICIENCY"
/// email : "teacher@lettutor.com"
/// google : null
/// facebook : null
/// apple : null
/// avatar : "https://api.app.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1627913015850.00"
/// name : "Keegan"
/// country : "VN"
/// phone : "84356030876"
/// language : "Ukrainian"
/// birthday : "1999-06-07"
/// requestPassword : true
/// isActivated : true
/// isPhoneActivated : null
/// requireNote : null
/// timezone : 7
/// phoneAuth : null
/// isPhoneAuthActivated : false
/// studySchedule : ""
/// canSendMessage : false
/// isPublicRecord : false
/// caredByStaffId : null
/// createdAt : "2021-08-02T14:03:36.320Z"
/// updatedAt : "2023-02-19T06:06:59.444Z"
/// deletedAt : null
/// studentGroupId : null
/// feedbacks : []
/// id : "6ca5c092-76ea-4e72-9c6e-05e2239aa33b"
/// userId : "4d54d3d7-d2a9-42e5-97a2-5ed38af5789a"
/// video : "https://api.app.lettutor.com/video/4d54d3d7-d2a9-42e5-97a2-5ed38af5789avideo1627913015871.mp4"
/// bio : "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia."
/// education : "BA"
/// experience : "I have more than 10 years of teaching english experience"
/// profession : "English teacher"
/// accent : null
/// targetStudent : "Advanced"
/// interests : " I loved the weather, the scenery and the laid-back lifestyle of the locals."
/// languages : "en"
/// specialties : "business-english,conversational-english,english-for-kids,ielts,toeic"
/// resume : null
/// rating : 4.2272727272727275
/// isNative : null
/// User : null
/// schedulestimes : "1"
/// isfavoritetutor : "1"
/// isOnline : true
/// price : 50000
class TutorInfo {
//<editor-fold desc="Data Methods">
  TutorInfo({
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
    this.isPhoneActivated,
    this.requireNote,
    this.timezone,
    this.phoneAuth,
    this.isPhoneAuthActivated,
    this.studySchedule,
    this.canSendMessage,
    this.isPublicRecord,
    this.caredByStaffId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.studentGroupId,
    this.feedbacks,
    this.id,
    this.userId,
    this.video,
    this.bio,
    this.education,
    this.experience,
    this.profession,
    this.accent,
    this.targetStudent,
    this.interests,
    this.languages,
    this.specialties,
    this.resume,
    this.rating,
    this.isNative,
    this.User,
    this.schedulestimes,
    this.isfavoritetutor,
    this.isOnline,
    this.price,
  });

  factory TutorInfo.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return TutorInfo(
      level: mapJson['level'] as String?,
      email :mapJson['email'] as String?,
      google: mapJson['google'],
      facebook: mapJson['facebook'],
      apple: mapJson['apple'],
      avatar: mapJson['avatar'] as String?,
      name: mapJson['name'] as String?,
      country: mapJson['country'] as String?,
      phone: mapJson['phone'] as String?,
      language: mapJson['language'] as String?,
      birthday: mapJson['birthday'] as String?,
      requestPassword: mapJson['requestPassword'] as bool?,
      isActivated: mapJson['isActivated'] as bool?,
      isPhoneActivated: mapJson['isPhoneActivated'],
      requireNote: mapJson['requireNote'],
      timezone: mapJson['timezone'] as num?,
      phoneAuth: mapJson['phoneAuth'],
      isPhoneAuthActivated: mapJson['isPhoneAuthActivated'] as bool?,
      studySchedule: mapJson['studySchedule'] as String?,
      canSendMessage: mapJson['canSendMessage'] as bool?,
      isPublicRecord: mapJson['isPublicRecord'] as bool?,
      caredByStaffId: mapJson['caredByStaffId'],
      createdAt: mapJson['createdAt'] as String?,
      updatedAt: mapJson['updatedAt'] as String?,
      deletedAt: mapJson['deletedAt'],
      studentGroupId: mapJson['studentGroupId'],
      feedbacks: mapJson['feedbacks'] != null
          ? (mapJson['feedbacks'] as List).map(FeedBack.fromJson).toList()
          : null,
      id: mapJson['id'] as String?,
      userId: mapJson['userId'] as String?,
      video: mapJson['video'] as String?,
      bio: mapJson['bio'] as String?,
      education :mapJson['education'] as String?,
      experience: mapJson['experience'] as String?,
      profession: mapJson['profession'] as String?,
      accent: mapJson['accent'],
      targetStudent: mapJson['targetStudent'] as String?,
      interests: mapJson['interests'] as String?,
      languages: mapJson['languages'] as String?,
      specialties: mapJson['specialties'] as String?,
      resume: mapJson['resume'],
      rating: mapJson['rating'] as num?,
      isNative: mapJson['isNative'],
      User: mapJson['User'] != null ? UserInfo.fromJson(mapJson['User']) : null,
      schedulestimes: mapJson['schedulestimes']as String?,
      isfavoritetutor: mapJson['isfavoritetutor'] as String?,
      isOnline: mapJson['isOnline'] as bool?,
      price: mapJson['price'] as num?,
    );
  }

  final String? level;
  final String? email;
  final dynamic google;
  final dynamic facebook;
  final dynamic apple;
  final String? avatar;
  final String? name;
  final String? country;
  final String? phone;
  final String? language;
  final String? birthday;
  final bool? requestPassword;
  final bool? isActivated;
  final dynamic isPhoneActivated;
  final dynamic requireNote;
  final num? timezone;
  final dynamic phoneAuth;
  final bool? isPhoneAuthActivated;
  final String? studySchedule;
  final bool? canSendMessage;
  final bool? isPublicRecord;
  final dynamic caredByStaffId;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;
  final dynamic studentGroupId;
  final List<FeedBack>? feedbacks;
  final String? id;
  final String? userId;
  final String? video;
  final String? bio;
  final String? education;
  final String? experience;
  final String? profession;
  final dynamic accent;
  final String? targetStudent;
  final String? interests;
  final String? languages;
  final String? specialties;
  final dynamic resume;
  final num? rating;
  final dynamic isNative;
  final UserInfo? User;
  final String? schedulestimes;
  final String? isfavoritetutor;
  final bool? isOnline;
  final num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['level'] = level;
    map['email'] = email;
    map['google'] = google;
    map['facebook'] = facebook;
    map['apple'] = apple;
    map['avatar'] = avatar;
    map['name'] = name;
    map['country'] = country;
    map['phone'] = phone;
    map['language'] = language;
    map['birthday'] = birthday;
    map['requestPassword'] = requestPassword;
    map['isActivated'] = isActivated;
    map['isPhoneActivated'] = isPhoneActivated;
    map['requireNote'] = requireNote;
    map['timezone'] = timezone;
    map['phoneAuth'] = phoneAuth;
    map['isPhoneAuthActivated'] = isPhoneAuthActivated;
    map['studySchedule'] = studySchedule;
    map['canSendMessage'] = canSendMessage;
    map['isPublicRecord'] = isPublicRecord;
    map['caredByStaffId'] = caredByStaffId;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['deletedAt'] = deletedAt;
    map['studentGroupId'] = studentGroupId;
    map['feedbacks'] = feedbacks?.map((e) => e.toJson()).toList();
    map['id'] = id;
    map['userId'] = userId;
    map['video'] = video;
    map['bio'] = bio;
    map['education'] = education;
    map['experience'] = experience;
    map['profession'] = profession;
    map['accent'] = accent;
    map['targetStudent'] = targetStudent;
    map['interests'] = interests;
    map['languages'] = languages;
    map['specialties'] = specialties;
    map['resume'] = resume;
    map['rating'] = rating;
    map['isNative'] = isNative;
    map['User'] = User?.toJson();
    map['schedulestimes'] = schedulestimes;
    map['isfavoritetutor'] = isfavoritetutor;
    map['isOnline'] = isOnline;
    map['price'] = price;
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TutorInfo &&
          runtimeType == other.runtimeType &&
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
          feedbacks == other.feedbacks &&
          id == other.id &&
          userId == other.userId &&
          video == other.video &&
          bio == other.bio &&
          education == other.education &&
          experience == other.experience &&
          profession == other.profession &&
          accent == other.accent &&
          targetStudent == other.targetStudent &&
          interests == other.interests &&
          languages == other.languages &&
          specialties == other.specialties &&
          resume == other.resume &&
          rating == other.rating &&
          isNative == other.isNative &&
          User == other.User &&
          schedulestimes == other.schedulestimes &&
          isfavoritetutor == other.isfavoritetutor &&
          isOnline == other.isOnline &&
          price == other.price);

  @override
  int get hashCode =>
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
      feedbacks.hashCode ^
      id.hashCode ^
      userId.hashCode ^
      video.hashCode ^
      bio.hashCode ^
      education.hashCode ^
      experience.hashCode ^
      profession.hashCode ^
      accent.hashCode ^
      targetStudent.hashCode ^
      interests.hashCode ^
      languages.hashCode ^
      specialties.hashCode ^
      resume.hashCode ^
      rating.hashCode ^
      isNative.hashCode ^
      User.hashCode ^
      schedulestimes.hashCode ^
      isfavoritetutor.hashCode ^
      isOnline.hashCode ^
      price.hashCode;

  @override
  String toString() {
    return 'TutorInfo{'
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
        ' feedbacks: $feedbacks,'
        ' id: $id,'
        ' userId: $userId,'
        ' video: $video,'
        ' bio: $bio,'
        ' education: $education,'
        ' experience: $experience,'
        ' profession: $profession,'
        ' accent: $accent,'
        ' targetStudent: $targetStudent,'
        ' interests: $interests,'
        ' languages: $languages,'
        ' specialties: $specialties,'
        ' resume: $resume,'
        ' rating: $rating,'
        ' isNative: $isNative,'
        ' User: $User,'
        ' schedulestimes: $schedulestimes,'
        ' isfavoritetutor: $isfavoritetutor,'
        ' isOnline: $isOnline,'
        ' price: $price,'
        ' }';
  }

  TutorInfo copyWith({
    String? level,
    String? email,
    dynamic google,
    dynamic facebook,
    dynamic apple,
    String? avatar,
    String? name,
    String? country,
    String? phone,
    String? language,
    String? birthday,
    bool? requestPassword,
    bool? isActivated,
    dynamic isPhoneActivated,
    dynamic requireNote,
    num? timezone,
    dynamic phoneAuth,
    bool? isPhoneAuthActivated,
    String? studySchedule,
    bool? canSendMessage,
    bool? isPublicRecord,
    dynamic caredByStaffId,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
    dynamic studentGroupId,
    List<FeedBack>? feedbacks,
    String? id,
    String? userId,
    String? video,
    String? bio,
    String? education,
    String? experience,
    String? profession,
    dynamic accent,
    String? targetStudent,
    String? interests,
    String? languages,
    String? specialties,
    dynamic resume,
    num? rating,
    dynamic isNative,
    UserInfo? User,
    String? schedulestimes,
    String? isfavoritetutor,
    bool? isOnline,
    num? price,
  }) {
    return TutorInfo(
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
      feedbacks: feedbacks ?? this.feedbacks,
      id: id ?? this.id,
      userId: userId ?? this.userId,
      video: video ?? this.video,
      bio: bio ?? this.bio,
      education: education ?? this.education,
      experience: experience ?? this.experience,
      profession: profession ?? this.profession,
      accent: accent ?? this.accent,
      targetStudent: targetStudent ?? this.targetStudent,
      interests: interests ?? this.interests,
      languages: languages ?? this.languages,
      specialties: specialties ?? this.specialties,
      resume: resume ?? this.resume,
      rating: rating ?? this.rating,
      isNative: isNative ?? this.isNative,
      User: User ?? this.User,
      schedulestimes: schedulestimes ?? this.schedulestimes,
      isfavoritetutor: isfavoritetutor ?? this.isfavoritetutor,
      isOnline: isOnline ?? this.isOnline,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
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
      'feedbacks': feedbacks?.map((e) => e.toMap()).toList(),
      'id': id,
      'userId': userId,
      'video': video,
      'bio': bio,
      'education': education,
      'experience': experience,
      'profession': profession,
      'accent': accent,
      'targetStudent': targetStudent,
      'interests': interests,
      'languages': languages,
      'specialties': specialties,
      'resume': resume,
      'rating': rating,
      'isNative': isNative,
      'User': User?.toMap(),
      'schedulestimes': schedulestimes,
      'isfavoritetutor': isfavoritetutor,
      'isOnline': isOnline,
      'price': price,
    };
  }

  factory TutorInfo.fromMap(Map<String, dynamic> map) {
    return TutorInfo(
      level: map['level'] as String?,
      email: map['email'] as String?,
      google: map['google'] as dynamic,
      facebook: map['facebook'] as dynamic,
      apple: map['apple'] as dynamic,
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
      studySchedule: map['studySchedule'] as String,
      canSendMessage: map['canSendMessage'] as bool?,
      isPublicRecord: map['isPublicRecord'] as bool?,
      caredByStaffId: map['caredByStaffId'] as dynamic,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as dynamic,
      studentGroupId: map['studentGroupId'] as dynamic,
      feedbacks: map['feedbacks'] != null
          ? (map['feedbacks'] as List).map(
              (e) => FeedBack.fromMap(e as Map<String, dynamic>)).toList()
          : null,
      id: map['id'] as String?,
      userId: map['userId'] as String?,
      video: map['video'] as String?,
      bio: map['bio'] as String?,
      education: map['education'] as String?,
      experience: map['experience'] as String?,
      profession: map['profession'] as String?,
      accent: map['accent'] as dynamic,
      targetStudent: map['targetStudent'] as String?,
      interests: map['interests'] as String?,
      languages: map['languages'] as String?,
      specialties: map['specialties'] as String?,
      resume: map['resume'] as dynamic,
      rating: map['rating'] as num?,
      isNative: map['isNative'] as dynamic,
      User: map['User'] != null
          ? UserInfo.fromMap(map['User'] as Map<String, dynamic>)
          : null,
      schedulestimes: map['schedulestimes'] as String?,
      isfavoritetutor: map['isfavoritetutor'] as String?,
      isOnline: map['isOnline'] as bool?,
      price: map['price'] as num?,
    );
  }

//</editor-fold>
}
