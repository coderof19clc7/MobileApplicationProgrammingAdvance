import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/map_constants.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/responses/user/user_info.dart';

part 'profile_state.dart';

class ProfileCubit extends WidgetCubit<ProfileState> {
  ProfileCubit({
    required this.refreshUserInfo,
  }) : super(widgetState: const ProfileState(isInitial: true));

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
    ));
  }

  void onChangeMode({required bool isEditMode}) {
    if (state.isEdit && !isEditMode) {
      resetUserInfo();
    }
    emitNewState(state.copyWith(isEdit: isEditMode));
  }

  void onSelectedWantToSturdyChanged({
    bool isLearnTopic = true,
    required bool isSelected,
    required String key,
  }) {
    final selectedList = isLearnTopic
        ? [...state.selectedLearnTopics]
        : [...state.selectedTestPreparations];
    if (isSelected) {
      selectedList.add(key);
    } else {
      selectedList.remove(key);
    }
    emitNewState(state.copyWith(
      selectedLearnTopics: isLearnTopic ? selectedList : state.selectedLearnTopics,
      selectedTestPreparations: isLearnTopic ? state.selectedTestPreparations : selectedList,
    ));
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
