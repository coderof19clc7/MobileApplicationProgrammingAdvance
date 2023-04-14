/// id : "36f7fdc3-39a7-48a4-9ac8-93a12c8e5f6f"
/// video : "https://sandbox.api.lettutor.com/undefined/undefined"
/// bio : "I am a teacher"
/// education : "MBS"
/// experience : "15 years of teaching"
/// profession : "Lecturer"
/// accent : null
/// targetStudent : "Advanced"
/// interests : "ABC"
/// languages : "English, Việt Nam"
/// specialties : "english-for-kids,business-english"
/// resume : null
/// rating : 0
/// isActivated : false
/// isNative : false
class TutorInfo {
//<editor-fold desc="Data Methods">

  TutorInfo({
    this.id,
    this.video,
    this.bio,
    this.education,
    this.experience,
    this.profession,
    required this.accent,
    this.targetStudent,
    this.interests,
    this.languages,
    this.specialties,
    required this.resume,
    this.rating,
    this.isActivated,
    this.isNative,
  });

  TutorInfo.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    id = mapJson['id'] as String?;
    video = mapJson['video'] as String?;
    bio = mapJson['bio'] as String?;
    education = mapJson['education'] as String?;
    experience = mapJson['experience'] as String?;
    profession = mapJson['profession'] as String?;
    accent = mapJson['accent'];
    targetStudent =mapJson['targetStudent'] as String?;
    interests = mapJson['interests'] as String?;
    languages = mapJson['languages'] as String?;
    specialties = mapJson['specialties'] as String?;
    resume = mapJson['resume'];
    rating = mapJson['rating'] as num?;
    isActivated = mapJson['isActivated'] as bool?;
    isNative = mapJson['isNative'] as bool?;
  }
  String? id;
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  dynamic accent;
  String? targetStudent;
  String? interests;
  String? languages;
  String? specialties;
  dynamic resume;
  num? rating;
  bool? isActivated;
  bool? isNative;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
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
    map['isActivated'] = isActivated;
    map['isNative'] = isNative;
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is TutorInfo &&
              runtimeType == other.runtimeType &&
              id == other.id &&
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
              isActivated == other.isActivated &&
              isNative == other.isNative);

  @override
  int get hashCode =>
      id.hashCode ^
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
      isActivated.hashCode ^
      isNative.hashCode;

  @override
  String toString() {
    return 'TutorInfo{'
        ' id: $id,'
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
        ' isActivated: $isActivated,'
        ' isNative: $isNative,'
        ' }';
  }

  TutorInfo copyWith({
    String? id,
    String? video,
    String? bio,
    String? education,
    String? experience,
    String? profession,
    dynamic? accent,
    String? targetStudent,
    String? interests,
    String? languages,
    String? specialties,
    dynamic? resume,
    num? rating,
    bool? isActivated,
    bool? isNative,
  }) {
    return TutorInfo(
      id: id ?? this.id,
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
      isActivated: isActivated ?? this.isActivated,
      isNative: isNative ?? this.isNative,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
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
      'isActivated': isActivated,
      'isNative': isNative,
    };
  }

  factory TutorInfo.fromMap(Map<String, dynamic> map) {
    return TutorInfo(
      id: map['id'] as String?,
      video: map['video'] as String?,
      bio: map['bio'] as String?,
      education: map['education'] as String?,
      experience: map['experience'] as String?,
      profession: map['profession'] as String?,
      accent: map['accent'],
      targetStudent: map['targetStudent'] as String?,
      interests: map['interests'] as String?,
      languages: map['languages'] as String?,
      specialties: map['specialties'] as String?,
      resume: map['resume'],
      rating: map['rating'] as num?,
      isActivated: map['isActivated'] as bool?,
      isNative: map['isNative'] as bool?,
    );
  }

//</editor-fold>
}