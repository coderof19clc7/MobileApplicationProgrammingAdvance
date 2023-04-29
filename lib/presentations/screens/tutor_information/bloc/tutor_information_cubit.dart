import 'package:flutter/foundation.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/responses/tutor/tutor_info.dart';
import 'package:one_one_learn/core/models/responses/tutor/tutor_info_response.dart';
import 'package:one_one_learn/core/models/responses/user/user_manage_favorite_tutor_response.dart';
import 'package:one_one_learn/core/network/repositories/tutor_repository.dart';
import 'package:one_one_learn/core/network/repositories/user_repository.dart';

part 'tutor_information_state.dart';

class TutorInformationCubit extends WidgetCubit<TutorInformationState> {
  TutorInformationCubit({required String tutorId})
      : super(widgetState: TutorInformationState(tutorId: tutorId));

  final _tutorRepository = injector<TutorRepository>();
  final _userRepository = injector<UserRepository>();

  @override
  void onWidgetCreated() {}

  Future<void> getTutorInformation() async {
    emit(state.copyWith(isLoadingData: true));
    final tutorInfoResponse = await fetchApi<TutorInfoResponse>(
      () async => _tutorRepository.getTutorInfoById(state.tutorId),
      showLoading: false,
    );

    if (tutorInfoResponse != null) {
      if (tutorInfoResponse.statusCode == ApiStatusCode.success
          && tutorInfoResponse.data != null
      ) {
        emit(state.copyWith(tutorInformation: tutorInfoResponse.data));
      }
    }
    emit(state.copyWith(isLoadingData: false));
  }

  void updateFavoriteStatus({required bool isFavorite}) {
    emit(state.copyWith(
      tutorInformation: state.tutorInformation?.copyWith(isFavorite: isFavorite),
    ));
  }

  Future<void> onTutorFavouriteStatusChanged(String tutorId, {
    Future<void> Function()? onManageFavouriteStatusSuccess,
  }) async {
    changeLoadingState(isLoading: true);
    final userManageFavouriteTutorResponse = await fetchApi<UserManageFavoriteTutorResponse>(
          () => _userRepository.manageFavoriteTutor(tutorId),
      showLoading: false,
    );

    if (userManageFavouriteTutorResponse != null) {
      if (userManageFavouriteTutorResponse.statusCode == ApiStatusCode.success) {
        await onManageFavouriteStatusSuccess?.call();
        emit(state.copyWith(
          tutorInformation: state.tutorInformation?.copyWith(
            isFavorite: !(state.tutorInformation?.isFavorite ?? false),
          ),
        ));
      }
    }
    changeLoadingState(isLoading: false);
  }
}
