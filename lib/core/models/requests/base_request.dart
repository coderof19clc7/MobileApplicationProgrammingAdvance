import 'package:one_one_learn/core/models/base_model.dart';

class BaseRequest extends BaseModel {
  const BaseRequest();

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{};
  }

  @override
  List<Object?> get props => [];
}