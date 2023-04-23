import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/requests/course/courses_list_request.dart';
import 'package:one_one_learn/core/models/responses/course/course_information.dart';
import 'package:one_one_learn/core/models/responses/course/courses_list_response.dart';
import 'package:one_one_learn/core/network/repositories/course_repository.dart';

part 'courses_state.dart';

class CoursesCubit extends WidgetCubit<CoursesState> {
  CoursesCubit() : super(widgetState: const CoursesState());

  final courseRepository = injector<CourseRepository>();
  final size = 10;
  final initialLoadMoreAbleList = <CourseInformation?>[null, null, null];

  @override
  void onWidgetCreated() {}

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
          () => courseRepository.getListCourses(CoursesListRequest(
        page: state.nextPage,
        size: size,
        q: state.coursesSearchText,
      )),
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
}
