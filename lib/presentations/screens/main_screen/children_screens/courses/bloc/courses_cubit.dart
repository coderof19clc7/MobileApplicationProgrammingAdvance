import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/requests/course/courses_list_request.dart';
import 'package:one_one_learn/core/models/responses/course/course_information.dart';
import 'package:one_one_learn/core/models/responses/course/courses_list_response.dart';
import 'package:one_one_learn/core/network/repositories/course_repository.dart';
import 'package:one_one_learn/generated/l10n.dart';

part 'courses_state.dart';

class CoursesCubit extends WidgetCubit<CoursesState> {
  CoursesCubit() : super(widgetState: const CoursesState());

  final courseRepository = injector<CourseRepository>();
  final size = 10;
  final initialLoadMoreAbleList = <CourseInformation?>[null, null, null];

  final categoriesMap = {
    'all': S.current.all,
    S.current.forStudyingAboard: '968e7e18-10c0-4742-9ec6-6f5c71c517f5',
    S.current.englishForTraveling: 'd95b69f7-b810-4cdf-b11d-49faaa71ff4b',
    S.current.conversationalEnglish: 'c4e7f418-4006-40f2-ba13-cbade54c1fd0',
    S.current.englishForBeginners: '488cc5f8-a5b1-45cd-8d3a-47e690f9298e',
    S.current.businessEnglish: 'f01cf003-25d1-432f-aaab-bf0e8390e14f',
    S.current.starters: '975f83f6-30c5-465d-8d98-65e4182369ba',
    S.current.englishForKids: 'fb92cf24-1736-4cd7-a042-fa3c37921cf8',
    S.current.pet: '0b89ead7-0e92-4aec-abce-ecfeba10dea5',
    S.current.ket: '248ca9f5-b46d-4a55-b81c-abafebff5876',
    S.current.movers: '534a94f1-579b-497d-b891-47d8e28e1b2c',
    S.current.flyers: 'df9bd876-c631-413c-9228-cc3d6a5c34fa',
    S.current.toefl: 'd87de7ba-bd4c-442c-8d58-957acb298f57',
    S.current.toeic: '1e662753-b305-47ad-a319-fa52340f5532',
    S.current.ielts: '255c96b6-fd6f-4f43-8dbd-fec766e361e0',
  };
  final levelsMap = {
    S.current.all: -1,
    'Any Level': 0,
    'Beginner': 1,
    'Upper Beginner': 2,
    'Pre-Intermediate': 3,
    'Intermediate': 4,
    'Upper-Intermediate': 5,
    'Pre-Advance': 6,
    'Advance': 7,
    'Very-Advance': 8,
  };
  final sortMap = {
    S.current.sortNameFromAtoZ: 0,
    S.current.sortSomethingsFromLow(S.current.level): 1,
    S.current.sortSomethingsFromHigh(S.current.level): -1,
  };


  @override
  void onWidgetCreated() {}

  List<String> getCurrentCategories() {
    final categories = state.listCategoriesId;
    return categories;
  }
  List<int> getCurrentLevelValues() {
    return state.listLevelValues;
  }

  CoursesListRequest getCoursesListRequest() {
    return CoursesListRequest(
      page: state.nextPage,
      size: size,
      q: state.coursesSearchText,
      categoriesId: getCurrentCategories(),
      levels: getCurrentLevelValues(),
      sortValue: state.sortValue,
    );
  }

  bool canListCoursesLoadMore() {
    // return state.listCourses.length < state.total;
    return state.listCourses.last == null;
  }

  List<CourseInformation?> getRealCurrentList() {
    final currentList = [...state.listCourses];
    if (currentList.last == null) {
      currentList.removeRange(state.listCourses.length - 3, state.listCourses.length);
    }
    return currentList;
  }

  Future<void> searchListCourses() async {
    emit(state.copyWith(isLoading: true));

    // search list by the filters amd page number
    final coursesListResponse = await fetchApi<CoursesListResponse>(
          () => courseRepository.getListCourses(getCoursesListRequest()),
      showLoading: false,
    );

    // handle the response
    print('currentListLength: ${
        canListCoursesLoadMore() ? state.listCourses.length - 3 : state.listCourses.length
    }');
    if (coursesListResponse != null) {
      if (coursesListResponse.statusCode == ApiStatusCode.success) {
        final newListCourses = coursesListResponse.data?.rows ?? <CourseInformation?>[];
        var finalNewListCourses = <CourseInformation?>[];
        print('newListCourses: ${newListCourses.length}');

        // combine current list and new list
        final newPage = state.nextPage + (newListCourses.isEmpty ? 0 : 1);
        final currentList = getRealCurrentList();
        finalNewListCourses = newListCourses.isEmpty ? [...currentList] : [...currentList, ...newListCourses];
        if (finalNewListCourses.length != currentList.length) {
          finalNewListCourses.addAll([null, null, null]);
        }
        print('finalNewListCourses: ${finalNewListCourses.length}');

        emit(state.copyWith(
          nextPage: newPage,
          total: coursesListResponse.data?.count?.toInt() ?? 0,
          listCourses: [...finalNewListCourses],
        ));
      } else {
        emit(state.copyWith(
          listCourses: [...getRealCurrentList()],
        ));
      }
    } else {
      emit(state.copyWith(
        listCourses: [...getRealCurrentList()],
      ));
    }

    // // turn off new list loading state no matter what
    // emit(state.copyWith(
    //   isRefreshing: false,
    // ));
    emit(state.copyWith(isLoading: false));
  }

  void onSearchTextSubmitted(String qText) {
    if (qText == state.coursesSearchText) {
      return;
    }

    emit(state.copyWith(
      coursesSearchText: qText,
      nextPage: 1, total: 0,
      listCourses: initialLoadMoreAbleList,
    ));
  }

  void onApplyFilters(List<String> newCategories, List<int> newLevelValues, int newSortValue) {
    // only apply new filters if they are different from the current ones
    if (listEquals(newCategories, getCurrentCategories())
        && listEquals(newLevelValues, getCurrentLevelValues())
        && newSortValue == state.sortValue
    ) {
      return;
    }

    emit(state.copyWith(
      nextPage: 1, total: 0,
      listCourses: initialLoadMoreAbleList,
      listCategoriesId: newCategories,
      listLevelValues: newLevelValues,
      sortValue: newSortValue,
    ));
  }
}
