import 'package:one_one_learn/core/models/responses/tutor/tutor_info.dart';

class FeedBack {
//<editor-fold desc="Data Methods">
  FeedBack({
    this.id,
    this.bookingId,
    this.firstId,
    this.secondId,
    this.rating,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.firstInfo,
  });

  FeedBack.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    id = mapJson['id'] as String?;
    bookingId = mapJson['bookingId'] as String?;
    firstId = mapJson['firstId'] as String?;
    secondId = mapJson['secondId'] as String?;
    rating = mapJson['rating'] as num?;
    content = mapJson['content'] as String?;
    createdAt = mapJson['createdAt'] as String?;
    updatedAt = mapJson['updatedAt'] as String?;
    firstInfo = mapJson['firstInfo'] != null ? TutorInfo.fromJson(mapJson['firstInfo']) : null;
  }

  String? id;
  String? bookingId;
  String? firstId;
  String? secondId;
  num? rating;
  String? content;
  String? createdAt;
  String? updatedAt;
  TutorInfo? firstInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['bookingId'] = bookingId;
    map['firstId'] = firstId;
    map['secondId'] = secondId;
    map['rating'] = rating;
    map['content'] = content;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (firstInfo != null) {
      map['firstInfo'] = firstInfo?.toJson();
    }
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FeedBack &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          bookingId == other.bookingId &&
          firstId == other.firstId &&
          secondId == other.secondId &&
          rating == other.rating &&
          content == other.content &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          firstInfo == other.firstInfo);

  @override
  int get hashCode =>
      id.hashCode ^
      bookingId.hashCode ^
      firstId.hashCode ^
      secondId.hashCode ^
      rating.hashCode ^
      content.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      firstInfo.hashCode;

  @override
  String toString() {
    return 'FeedBack{'
        ' id: $id,'
        ' bookingId: $bookingId,'
        ' firstId: $firstId,'
        ' secondId: $secondId,'
        ' rating: $rating,'
        ' content: $content,'
        ' createdAt: $createdAt,'
        ' updatedAt: $updatedAt,'
        ' firstInfo: $firstInfo,'
        ' }';
  }

  FeedBack copyWith({
    String? id,
    String? bookingId,
    String? firstId,
    String? secondId,
    num? rating,
    String? content,
    String? createdAt,
    String? updatedAt,
    TutorInfo? firstInfo,
  }) {
    return FeedBack(
      id: id ?? this.id,
      bookingId: bookingId ?? this.bookingId,
      firstId: firstId ?? this.firstId,
      secondId: secondId ?? this.secondId,
      rating: rating ?? this.rating,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      firstInfo: firstInfo ?? this.firstInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bookingId': bookingId,
      'firstId': firstId,
      'secondId': secondId,
      'rating': rating,
      'content': content,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'firstInfo': firstInfo?.toMap(),
    };
  }

  factory FeedBack.fromMap(Map<String, dynamic> map) {
    return FeedBack(
      id: map['id'] as String?,
      bookingId: map['bookingId'] as String?,
      firstId: map['firstId'] as String?,
      secondId: map['secondId'] as String?,
      rating: map['rating'] as num?,
      content: map['content'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      firstInfo: map['firstInfo'] != null
          ? TutorInfo.fromMap(map['firstInfo'] as Map<String, dynamic>) : null,
    );
  }

//</editor-fold>
}
