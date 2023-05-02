import 'package:flutter/foundation.dart';

@immutable
class ClassReview {
  const ClassReview({
    this.bookingId,
    this.lessonStatusId,
    this.book,
    this.unit,
    this.lesson,
    this.page,
    this.lessonProgress,
    this.behaviorRating,
    this.behaviorComment,
    this.listeningRating,
    this.listeningComment,
    this.speakingRating,
    this.speakingComment,
    this.vocabularyRating,
    this.vocabularyComment,
    this.homeworkComment,
    this.overallComment,
    this.lessonStatus,
  });

  factory ClassReview.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return ClassReview(
      bookingId: mapJson['bookingId'] as String?,
      lessonStatusId: mapJson['lessonStatusId'] as num?,
      book: mapJson['book'] as String?,
      unit: mapJson['unit'] as String?,
      lesson: mapJson['lesson'] as String?,
      page: mapJson['page'] as String?,
      lessonProgress: mapJson['lessonProgress'] as String?,
      behaviorRating: mapJson['behaviorRating'] as num?,
      behaviorComment: mapJson['behaviorComment'] as String?,
      listeningRating: mapJson['listeningRating'] as num?,
      listeningComment: mapJson['listeningComment'] as String?,
      speakingRating: mapJson['speakingRating'] as num?,
      speakingComment: mapJson['speakingComment'] as String?,
      vocabularyRating: mapJson['vocabularyRating'] as num?,
      vocabularyComment: mapJson['vocabularyComment'] as String?,
      homeworkComment: mapJson['homeworkComment'] as String?,
      overallComment: mapJson['overallComment'] as String?,
      lessonStatus: mapJson['lessonStatus'] != null
          ? LessonStatus.fromJson(mapJson['lessonStatus'])
          : null,
    );
  }

  final String? bookingId;
  final num? lessonStatusId;
  final String? book;
  final String? unit;
  final String? lesson;
  final String? page;
  final String? lessonProgress;
  final num? behaviorRating;
  final String? behaviorComment;
  final num? listeningRating;
  final String? listeningComment;
  final num? speakingRating;
  final String? speakingComment;
  final num? vocabularyRating;
  final String? vocabularyComment;
  final String? homeworkComment;
  final String? overallComment;
  final LessonStatus? lessonStatus;

  ClassReview copyWith({
    String? bookingId,
    num? lessonStatusId,
    String? book,
    String? unit,
    String? lesson,
    String? page,
    String? lessonProgress,
    num? behaviorRating,
    String? behaviorComment,
    num? listeningRating,
    String? listeningComment,
    num? speakingRating,
    String? speakingComment,
    num? vocabularyRating,
    String? vocabularyComment,
    String? homeworkComment,
    String? overallComment,
    LessonStatus? lessonStatus,
  }) => ClassReview(
    bookingId: bookingId ?? this.bookingId,
    lessonStatusId: lessonStatusId ?? this.lessonStatusId,
    book: book ?? this.book,
    unit: unit ?? this.unit,
    lesson: lesson ?? this.lesson,
    page: page ?? this.page,
    lessonProgress: lessonProgress ?? this.lessonProgress,
    behaviorRating: behaviorRating ?? this.behaviorRating,
    behaviorComment: behaviorComment ?? this.behaviorComment,
    listeningRating: listeningRating ?? this.listeningRating,
    listeningComment: listeningComment ?? this.listeningComment,
    speakingRating: speakingRating ?? this.speakingRating,
    speakingComment: speakingComment ?? this.speakingComment,
    vocabularyRating: vocabularyRating ?? this.vocabularyRating,
    vocabularyComment: vocabularyComment ?? this.vocabularyComment,
    homeworkComment: homeworkComment ?? this.homeworkComment,
    overallComment: overallComment ?? this.overallComment,
    lessonStatus: lessonStatus ?? this.lessonStatus,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bookingId'] = bookingId;
    map['lessonStatusId'] = lessonStatusId;
    map['book'] = book;
    map['unit'] = unit;
    map['lesson'] = lesson;
    map['page'] = page;
    map['lessonProgress'] = lessonProgress;
    map['behaviorRating'] = behaviorRating;
    map['behaviorComment'] = behaviorComment;
    map['listeningRating'] = listeningRating;
    map['listeningComment'] = listeningComment;
    map['speakingRating'] = speakingRating;
    map['speakingComment'] = speakingComment;
    map['vocabularyRating'] = vocabularyRating;
    map['vocabularyComment'] = vocabularyComment;
    map['homeworkComment'] = homeworkComment;
    map['overallComment'] = overallComment;
    if (lessonStatus != null) {
      map['lessonStatus'] = lessonStatus?.toJson();
    }
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ClassReview &&
              runtimeType == other.runtimeType &&
              bookingId == other.bookingId &&
              lessonStatusId == other.lessonStatusId &&
              book == other.book &&
              unit == other.unit &&
              lesson == other.lesson &&
              page == other.page &&
              lessonProgress == other.lessonProgress &&
              behaviorRating == other.behaviorRating &&
              behaviorComment == other.behaviorComment &&
              listeningRating == other.listeningRating &&
              listeningComment == other.listeningComment &&
              speakingRating == other.speakingRating &&
              speakingComment == other.speakingComment &&
              vocabularyRating == other.vocabularyRating &&
              vocabularyComment == other.vocabularyComment &&
              homeworkComment == other.homeworkComment &&
              overallComment == other.overallComment &&
              lessonStatus == other.lessonStatus;

  @override
  int get hashCode =>
      bookingId.hashCode ^
      lessonStatusId.hashCode ^
      book.hashCode ^
      unit.hashCode ^
      lesson.hashCode ^
      page.hashCode ^
      lessonProgress.hashCode ^
      behaviorRating.hashCode ^
      behaviorComment.hashCode ^
      listeningRating.hashCode ^
      listeningComment.hashCode ^
      speakingRating.hashCode ^
      speakingComment.hashCode ^
      vocabularyRating.hashCode ^
      vocabularyComment.hashCode ^
      homeworkComment.hashCode ^
      overallComment.hashCode ^
      lessonStatus.hashCode;

  @override
  String toString() {
    return 'ClassReview{'
        ' bookingId: $bookingId,'
        ' lessonStatusId: $lessonStatusId,'
        ' book: $book,'
        ' unit: $unit,'
        ' lesson: $lesson,'
        ' page: $page,'
        ' lessonProgress: $lessonProgress,'
        ' behaviorRating: $behaviorRating,'
        ' behaviorComment: $behaviorComment,'
        ' listeningRating: $listeningRating,'
        ' listeningComment: $listeningComment,'
        ' speakingRating: $speakingRating,'
        ' speakingComment: $speakingComment,'
        ' vocabularyRating: $vocabularyRating,'
        ' vocabularyComment: $vocabularyComment,'
        ' homeworkComment: $homeworkComment,'
        ' overallComment: $overallComment,'
        ' lessonStatus: $lessonStatus'
        ' }';
  }

  Map<String, dynamic> toMap() {
    return {
      'bookingId': bookingId,
      'lessonStatusId': lessonStatusId,
      'book': book,
      'unit': unit,
      'lesson': lesson,
      'page': page,
      'lessonProgress': lessonProgress,
      'behaviorRating': behaviorRating,
      'behaviorComment': behaviorComment,
      'listeningRating': listeningRating,
      'listeningComment': listeningComment,
      'speakingRating': speakingRating,
      'speakingComment': speakingComment,
      'vocabularyRating': vocabularyRating,
      'vocabularyComment': vocabularyComment,
      'homeworkComment': homeworkComment,
      'overallComment': overallComment,
      'lessonStatus': lessonStatus?.toMap(),
    };
  }

  factory ClassReview.fromMap(Map<String, dynamic> map) {
    return ClassReview(
      bookingId: map['bookingId'] as String?,
      lessonStatusId: map['lessonStatusId'] as num?,
      book: map['book'] as String?,
      unit: map['unit'] as String?,
      lesson: map['lesson'] as String?,
      page: map['page'] as String?,
      lessonProgress: map['lessonProgress'] as String?,
      behaviorRating: map['behaviorRating'] as num?,
      behaviorComment: map['behaviorComment'] as String?,
      listeningRating: map['listeningRating'] as num?,
      listeningComment: map['listeningComment'] as String?,
      speakingRating: map['speakingRating'] as num?,
      speakingComment: map['speakingComment'] as String?,
      vocabularyRating: map['vocabularyRating'] as num?,
      vocabularyComment: map['vocabularyComment'] as String?,
      homeworkComment: map['homeworkComment'] as String?,
      overallComment: map['overallComment'] as String?,
      lessonStatus: map['lessonStatus'] != null
          ? LessonStatus.fromMap(map['lessonStatus'] as Map<String, dynamic>)
          : null,
    );
  }
}

@immutable
class LessonStatus {
  const LessonStatus({
    this.id,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory LessonStatus.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return LessonStatus(
      id: mapJson['id'] as num?,
      status: mapJson['status'] as String?,
      createdAt: mapJson['createdAt'] as String?,
      updatedAt: mapJson['updatedAt'] as String?,
    );
  }

  final num? id;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  LessonStatus copyWith({
    num? id,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) => LessonStatus(
    id: id ?? this.id,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LessonStatus &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          status == other.status &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt;

  @override
  int get hashCode =>
      id.hashCode ^ status.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'LessonStatus{'
        ' id: $id,'
        ' status: $status,'
        ' createdAt: $createdAt,'
        ' updatedAt: $updatedAt'
        ' }';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['status'] = status;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory LessonStatus.fromMap(Map<String, dynamic> map) {
    return LessonStatus(
      id: map['id'] as num?,
      status: map['status'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
    );
  }
}
