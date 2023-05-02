import 'package:one_one_learn/core/models/requests/base_request.dart';

class ReportTutorRequest extends BaseRequest {

  @override
  List<Object?> get props => [tutorId, content];

//<editor-fold desc="Data Methods">
  const ReportTutorRequest({
    this.tutorId,
    this.content,
  });

  factory ReportTutorRequest.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return ReportTutorRequest(
      tutorId: mapJson['tutorId'] as String?,
      content: mapJson['content'] as String?,
    );
  }

  final String? tutorId;
  final String? content;

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (tutorId?.isNotEmpty == true) {
      map['tutorId'] = tutorId;
    }
    if (content?.isNotEmpty == true) {
      map['content'] = content;
    }
    return map;
  }

  @override
  String toString() {
    return 'ReportTutorRequest{'
        ' tutorId: $tutorId,'
        ' content: $content,'
        ' }';
  }

  ReportTutorRequest copyWith({
    String? tutorId,
    String? content,
  }) {
    return ReportTutorRequest(
      tutorId: tutorId ?? this.tutorId,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tutorId': tutorId,
      'content': content,
    };
  }

  factory ReportTutorRequest.fromMap(Map<String, dynamic> map) {
    return ReportTutorRequest(
      tutorId: map['tutorId'] as String?,
      content: map['content'] as String?,
    );
  }

//</editor-fold>
}
