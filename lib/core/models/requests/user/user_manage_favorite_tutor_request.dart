import 'package:one_one_learn/core/models/requests/base_request.dart';

class UserManageFavoriteTutorRequest extends BaseRequest {
  final String? tutorId;

//<editor-fold desc="Data Methods">
  const UserManageFavoriteTutorRequest({
    this.tutorId,
  });

  factory UserManageFavoriteTutorRequest.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return UserManageFavoriteTutorRequest(
      tutorId: mapJson['tutorId'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['tutorId'] = tutorId;
    return data;
  }

  @override
  List<Object?> get props => [tutorId];

  @override
  String toString() {
    return 'UserForgotPasswordRequest{ tutorId: $tutorId }';
  }

  UserManageFavoriteTutorRequest copyWith({
    String? tutorId,
  }) {
    return UserManageFavoriteTutorRequest(
      tutorId: tutorId ?? this.tutorId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tutorId': tutorId,
    };
  }

  factory UserManageFavoriteTutorRequest.fromMap(Map<String, dynamic> map) {
    return UserManageFavoriteTutorRequest(
      tutorId: map['tutorId'] as String?,
    );
  }

//</editor-fold>
}
