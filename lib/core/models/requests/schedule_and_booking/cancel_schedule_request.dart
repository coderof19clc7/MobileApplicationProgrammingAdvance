import 'package:flutter/material.dart';
import 'package:one_one_learn/core/models/requests/base_request.dart';

class CancelScheduleRequest extends BaseRequest {
  final String? scheduleDetailId;
  final CancelInfo? cancelInfo;

  const CancelScheduleRequest({
    this.scheduleDetailId,
    this.cancelInfo,
  });

  CancelScheduleRequest copyWith({
    String? scheduleDetailId,
    CancelInfo? cancelInfo,
  }) {
    return CancelScheduleRequest(
      scheduleDetailId: scheduleDetailId ?? this.scheduleDetailId,
      cancelInfo: cancelInfo ?? this.cancelInfo,
    );
  }

  factory CancelScheduleRequest.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return CancelScheduleRequest(
      scheduleDetailId: mapJson['scheduleDetailId'] as String?,
      cancelInfo: mapJson['cancelInfo'] != null
          ? CancelInfo.fromJson(mapJson['cancelInfo'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (scheduleDetailId != null && scheduleDetailId?.isNotEmpty == true) {
      map['scheduleDetailId'] = scheduleDetailId;
    }
    if (cancelInfo != null) {
      map['cancelInfo'] = cancelInfo?.toJson();
    }
    return map;
  }

  @override
  List<Object?> get props => [scheduleDetailId, cancelInfo];

  @override
  String toString() {
    return 'BookedClassesRequest{'
        ' scheduleDetailId: $scheduleDetailId,'
        ' cancelInfo: $cancelInfo,'
        ' }';
  }

  Map<String, dynamic> toMap() {
    return {
      'scheduleDetailId': scheduleDetailId,
      'cancelInfo': cancelInfo?.toMap(),
    };
  }

  factory CancelScheduleRequest.fromMap(Map<String, dynamic> map) {
    return CancelScheduleRequest(
      scheduleDetailId: map['scheduleDetailId'] as String?,
      cancelInfo: map['cancelInfo'] != null
          ? CancelInfo.fromMap(map['cancelInfo'] as Map<String, dynamic>)
          : null,
    );
  }
}

@immutable
class CancelInfo {
  final int? cancelReasonId;
  final String? note;

  const CancelInfo({
    this.cancelReasonId,
    this.note,
  });

  CancelInfo copyWith({
    int? cancelReasonId,
    String? note,
  }) {
    return CancelInfo(
      cancelReasonId: cancelReasonId ?? this.cancelReasonId,
      note: note ?? this.note,
    );
  }

  factory CancelInfo.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return CancelInfo(
      cancelReasonId: mapJson['cancelReasonId'] as int?,
      note: mapJson['note'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (cancelReasonId != null) {
      map['cancelReasonId'] = cancelReasonId;
    }
    if (note != null && note?.isNotEmpty == true) {
      map['note'] = note;
    }
    return map;
  }

  @override
  String toString() {
    return 'BookedClassesRequest{'
        ' cancelReasonId: $cancelReasonId,'
        ' note: $note,'
        ' }';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CancelInfo &&
          runtimeType == other.runtimeType &&
          cancelReasonId == other.cancelReasonId &&
          note == other.note;

  @override
  int get hashCode => cancelReasonId.hashCode ^ note.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'cancelReasonId': cancelReasonId,
      'note': note,
    };
  }

  factory CancelInfo.fromMap(Map<String, dynamic> map) {
    return CancelInfo(
      cancelReasonId: map['cancelReasonId'] as int?,
      note: map['note'] as String?,
    );
  }
}
