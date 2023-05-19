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
  final scrollController = ScrollController();

  Map<int, String> get sortMap => {
    0: S.current.sortNameFromAtoZ,
    1: S.current.sortSomethingsFromLow(S.current.level.toLowerCase()),
    -1: S.current.sortSomethingsFromHigh(S.current.level.toLowerCase()),
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
    if (state.listCourses.isEmpty) {
      return false;
    }
    return state.listCourses.last == null;
  }

  List<CourseInformation?> getRealCurrentList() {
    final currentList = [...state.listCourses];
    if (canListCoursesLoadMore()) {
      currentList.removeRange(state.listCourses.length - 3, state.listCourses.length);
    }
    return currentList;
  }

  Future<void> searchListCourses() async {
    changeLoadingState(isLoading: true);

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
        var newPage = state.nextPage;
        final newListCourses = coursesListResponse.data?.rows ?? <CourseInformation?>[];
        if (newListCourses.isNotEmpty) {
          final removeRange = newPage * size - getRealCurrentList().length;
          newListCourses.removeRange(
            0, removeRange < size ? size - removeRange : 0,
          );
        }
        var finalNewListCourses = <CourseInformation?>[];
        print('newListCourses: ${newListCourses.length}');

        // combine current list and new list
        final currentList = getRealCurrentList();
        finalNewListCourses = newListCourses.isEmpty ? [...currentList] : [...currentList, ...newListCourses];
        if (finalNewListCourses.length != currentList.length) {
          finalNewListCourses.addAll([null, null, null]);
        }
        print('finalNewListCourses: ${finalNewListCourses.length}');

        if (finalNewListCourses.length >= newPage * size) {
          newPage += 1;
        }

        emitNewState(state.copyWith(
          nextPage: newPage,
          total: coursesListResponse.data?.count?.toInt() ?? 0,
          listCourses: [...finalNewListCourses],
        ));
      } else {
        emitNewState(state.copyWith(
          listCourses: [...getRealCurrentList()],
        ));
      }
    } else {
      emitNewState(state.copyWith(
        listCourses: [...getRealCurrentList()],
      ));
    }

    changeLoadingState(isLoading: false);
  }

  void onSearchTextSubmitted(String qText) {
    if (qText == state.coursesSearchText) {
      return;
    }

    if (scrollController.hasClients) {
      scrollController.jumpTo(0);
    }

    emitNewState(state.copyWith(
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

    if (scrollController.hasClients) {
      scrollController.jumpTo(0);
    }

    emitNewState(state.copyWith(
      nextPage: 1, total: 0,
      listCourses: initialLoadMoreAbleList,
      listCategoriesId: newCategories,
      listLevelValues: newLevelValues,
      sortValue: newSortValue,
    ));
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
