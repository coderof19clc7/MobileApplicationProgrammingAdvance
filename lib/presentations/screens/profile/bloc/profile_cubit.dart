import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/configs/constants/map_constants.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/requests/user/put_user_info_request.dart';
import 'package:one_one_learn/core/models/responses/user/user_info.dart';
import 'package:one_one_learn/core/network/repositories/user_repository.dart';
import 'package:one_one_learn/generated/l10n.dart';

part 'profile_state.dart';

class ProfileCubit extends WidgetCubit<ProfileState> {
  ProfileCubit({
    required this.refreshUserInfo,
  }) : super(widgetState: const ProfileState(isInitial: true));

  final userRepository = injector<UserRepository>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController countrySearchController = TextEditingController();
  final TextEditingController sturdyScheduleController = TextEditingController();

  @override
  void onWidgetCreated() {
    refreshUserInfo.call().then((value) {
      resetUserInfo();
      emitNewState(state.copyWith(isInitial: false));
    });
  }

  final Future<void> Function() refreshUserInfo;

  void resetUserInfo() {
    final userInfo = localManager.getUserInfo();

    // get current name, dob and sturdy schedule
    nameController.text = userInfo?.name ?? '';
    dateOfBirthController.text = userInfo?.birthday ?? '';
    sturdyScheduleController.text = userInfo?.studySchedule ?? '';

    // get current want to sturdy subjects and test preparations
    final selectedLearnTopics = <String>[];
    final learnTopics = userInfo?.learnTopics ?? [];
    for (final learnTopic in learnTopics) {
      if (learnTopic.name != null) {
        selectedLearnTopics.add(learnTopic.key ?? '');
      }
    }
    final selectedTestPreparations = <String>[];
    final listTestPreparation = userInfo?.testPreparations ?? [];
    for (final testPreparation in listTestPreparation) {
      if (testPreparation.name != null) {
        selectedTestPreparations.add(testPreparation.key ?? '');
      }
    }

    emitNewState(state.copyWith(
      userInfo: localManager.getUserInfo(),
      selectedLearnTopics: selectedLearnTopics,
      selectedTestPreparations: selectedTestPreparations,
      avatarPath: '',
    ));
  }

  void onChangeMode({required bool isEditMode}) {
    final errorsMap = {...state.errorsMap};
    if (state.isEdit && !isEditMode) {
      resetUserInfo();
      errorsMap.clear();
    }
    emitNewState(state.copyWith(isEdit: isEditMode, errorsMap: errorsMap));
  }

  void onAFieldChanged(String newValue, String fieldName, {
    String text = '',
    bool isWantToStudy = false,
  }) {
    final errorsMap = {...state.errorsMap};
    if (newValue.trim().isEmpty) {
      errorsMap[fieldName] = isWantToStudy
          ? S.current.wantToStudyRequired
          : S.current.pleaseInputSomethings(text);
      emitNewState(state.copyWith(errorsMap: errorsMap));
    } else if (errorsMap[fieldName] != null) {
      errorsMap.remove(fieldName);
      emitNewState(state.copyWith(errorsMap: errorsMap));
    }
  }

  void onSelectedWantToSturdyChanged({
    bool isLearnTopic = true,
    required bool isSelected,
    required String key,
  }) {
    final selectedList = isLearnTopic
        ? [...state.selectedLearnTopics]
        : [...state.selectedTestPreparations];
    final otherList = isLearnTopic
        ? [...state.selectedTestPreparations]
        : [...state.selectedLearnTopics];
    if (isSelected) {
      selectedList.add(key);
    } else {
      selectedList.remove(key);
    }

    // validate after change
    final newValue = [...selectedList, ...otherList];
    onAFieldChanged(newValue.join(', '), 'wantToLearn', isWantToStudy: true);

    emitNewState(state.copyWith(
      selectedLearnTopics: isLearnTopic ? selectedList : state.selectedLearnTopics,
      selectedTestPreparations: isLearnTopic ? state.selectedTestPreparations : selectedList,
    ));
  }

  Future<int> putUserInfoChanges() async {
    var result = 0;
    final response = await fetchApi(
      () => userRepository.putUserInfoChanges(
        putUserInfoRequest: PutUserInfoRequest(
          name: nameController.text,
          birthday: dateOfBirthController.text,
          country: state.userInfo?.country,
          studySchedule: sturdyScheduleController.text,
          level: state.userInfo?.level,
          learnTopics: state.selectedLearnTopics.map((e) {
            return MapConstants.learnTopicsMap[e]?['id'] ?? '';
          }).toList(),
          testPreparations: state.selectedTestPreparations.map((e) {
            return MapConstants.testPreparationsMap[e]?['id'] ?? '';
          }).toList(),
        ),
      ),
      showLoading: false,
      showToastError: false,
    );

    if (response != null && response.statusCode != ApiStatusCode.success) {
      result = -1;
    }

    return result;
  }

  Future<int> uploadAvatar() async {
    var result = 0;
    final response = await fetchApi(
          () => userRepository.uploadUserAvatar(
        avatar: state.avatarPath,
      ),
      showLoading: false,
      showToastError: false,
    );

    if (response == null || response.statusCode != ApiStatusCode.success) {
      result = -1;
    }

    return result;
  }

  bool validateBeforeUpdateProfile() {
    var isValid = true;

    final errorsMap = {...state.errorsMap};
    if (nameController.text.trim().isEmpty) {
      isValid = false;
      errorsMap['name'] = S.current.pleaseInputSomethings(S.current.name);
    } else {
      errorsMap.remove('name');
    }
    if (dateOfBirthController.text.trim().isEmpty) {
      isValid = false;
      errorsMap['dob'] = S.current.pleaseInputSomethings(S.current.dateOfBirth);
    } else {
      errorsMap.remove('dob');
    }
    if (state.userInfo?.country?.trim().isNotEmpty != true) {
      isValid = false;
      errorsMap['country'] = S.current.pleaseInputSomethings(S.current.country);
    } else {
      errorsMap.remove('country');
    }
    if (state.userInfo?.level?.trim().isNotEmpty != true) {
      isValid = false;
      errorsMap['level'] = S.current.pleaseInputSomethings(S.current.level);
    } else {
      errorsMap.remove('level');
    }
    final wantToStudy = [...state.selectedLearnTopics, ...state.selectedTestPreparations];
    if (wantToStudy.isEmpty) {
      isValid = false;
      errorsMap['wantToLearn'] = S.current.wantToStudyRequired;
    } else {
      errorsMap.remove('wantToLearn');
    }

    emitNewState(state.copyWith(errorsMap: errorsMap));
    return isValid;
  }

  Future<void> onUploadUserInfoChanges() async {
    // can only upload if all input fields are valid
    final canUpload = validateBeforeUpdateProfile();
    if (!canUpload) {
      return;
    }

    // get upload functions to call
    final listUploadFunctions = <Future<int>>[];
    if (state.avatarPath.isNotEmpty) {
      listUploadFunctions.add(uploadAvatar());
    }
    listUploadFunctions.add(putUserInfoChanges());

    // start uploading
    changeLoadingState(isLoading: true);

    final resultsList = await Future.wait(listUploadFunctions);
    if (resultsList.length < 2) {
      resultsList.insert(0, 1);
    }

    var isSuccessful = true;
    var message = S.current.updateProfile;
    if (resultsList[0] < 0 && resultsList[1] >= 0) {
      isSuccessful = false;
      message = S.current.uploadAvatar;
    } else if (resultsList[0] >= 0 && resultsList[1] < 0) {
      isSuccessful = false;
      message = S.current.uploadUserInfo;
    } else if (resultsList[0] < 0 && resultsList[1] < 0) {
      isSuccessful = false;
      message = S.current.updateProfile;
    }

    await refreshUserInfo.call();

    if (isSuccessful) {
      showSuccessToast(S.current.doSomethingsSuccess(message));
      onChangeMode(isEditMode: false);
    } else {
      showErrorToast(S.current.doSomethingsFailed(message));
    }

    changeLoadingState(isLoading: false);
  }

  @override
  Future<void> close() async {
    nameController.dispose();
    dateOfBirthController.dispose();
    countrySearchController.dispose();
    sturdyScheduleController.dispose();
    return super.close();
  }
}
