import 'package:one_one_learn/core/models/requests/base_request.dart';

class EditRequestRequest extends BaseRequest {
  final String? studentRequest;

  const EditRequestRequest({
    this.studentRequest,
  });

  EditRequestRequest copyWith({
    String? studentRequest,
  }) {
    return EditRequestRequest(
      studentRequest: studentRequest ?? this.studentRequest,
    );
  }

  factory EditRequestRequest.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return EditRequestRequest(
      studentRequest: mapJson['studentRequest'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (studentRequest != null && studentRequest?.isNotEmpty == true) {
      map['studentRequest'] = studentRequest;
    }
    return map;
  }

  @override
  List<Object?> get props => [studentRequest];

  @override
  String toString() {
    return 'BookedClassesRequest{'
        ' studentRequest: $studentRequest,'
        ' }';
  }

  Map<String, dynamic> toMap() {
    return {
      'studentRequest': studentRequest,
    };
  }

  factory EditRequestRequest.fromMap(Map<String, dynamic> map) {
    return EditRequestRequest(
      studentRequest: map['studentRequest'] as String?,
    );
  }
}
