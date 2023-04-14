/// referralCode : "WJDRSTWNES"
/// referralPackInfo : {"earnPercent":5}
class ReferralInfo {
//<editor-fold desc="Data Methods">

  ReferralInfo({
    this.referralCode,
    this.referralPackInfo,
  });

  ReferralInfo.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    referralCode = mapJson['referralCode'] as String?;
    referralPackInfo = mapJson['referralPackInfo'] != null
        ? ReferralPackInfo.fromJson(mapJson['referralPackInfo']) : null;
  }
  String? referralCode;
  ReferralPackInfo? referralPackInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['referralCode'] = referralCode;
    if (referralPackInfo != null) {
      map['referralPackInfo'] = referralPackInfo?.toJson();
    }
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is ReferralInfo &&
              runtimeType == other.runtimeType &&
              referralCode == other.referralCode &&
              referralPackInfo == other.referralPackInfo);

  @override
  int get hashCode => referralCode.hashCode ^ referralPackInfo.hashCode;

  @override
  String toString() {
    return 'ReferralInfo{'
        ' referralCode: $referralCode,'
        ' referralPackInfo: $referralPackInfo,'
        ' }';
  }

  ReferralInfo copyWith({
    String? referralCode,
    ReferralPackInfo? referralPackInfo,
  }) {
    return ReferralInfo(
      referralCode: referralCode ?? this.referralCode,
      referralPackInfo: referralPackInfo ?? this.referralPackInfo,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['referralCode'] = referralCode;
    if (referralPackInfo != null) {
      map['referralPackInfo'] = referralPackInfo?.toMap();
    }
    return map;
  }

  factory ReferralInfo.fromMap(Map<String, dynamic> map) {
    return ReferralInfo(
      referralCode: map['referralCode'] as String,
      referralPackInfo: map['referralPackInfo'] != null
          ? ReferralPackInfo.fromMap(
        map['referralPackInfo'] as Map<String, dynamic>,
      ) : null,
    );
  }

//</editor-fold>
}

/// earnPercent : 5
class ReferralPackInfo {
//<editor-fold desc="Data Methods">

  ReferralPackInfo({
    this.earnPercent,
  });

  ReferralPackInfo.fromJson(dynamic json) {
    earnPercent = (json as Map<String, dynamic>)['earnPercent'] as num?;
  }
  num? earnPercent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['earnPercent'] = earnPercent;
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is ReferralPackInfo &&
              runtimeType == other.runtimeType &&
              earnPercent == other.earnPercent);

  @override
  int get hashCode => earnPercent.hashCode;

  @override
  String toString() {
    return 'ReferralPackInfo{ earnPercent: $earnPercent, }';
  }

  ReferralPackInfo copyWith({
    num? earnPercent,
  }) {
    return ReferralPackInfo(
      earnPercent: earnPercent ?? this.earnPercent,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'earnPercent': earnPercent,
    };
  }

  factory ReferralPackInfo.fromMap(Map<String, dynamic> map) {
    return ReferralPackInfo(
      earnPercent: map['earnPercent'] as num?,
    );
  }

//</editor-fold>
}