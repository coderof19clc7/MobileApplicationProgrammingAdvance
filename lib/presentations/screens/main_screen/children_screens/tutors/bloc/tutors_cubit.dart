import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/requests/tutor/tutor_search_request.dart';
import 'package:one_one_learn/core/models/responses/tutor/tutor_info.dart';
import 'package:one_one_learn/core/models/responses/tutor/tutor_search_response.dart';
import 'package:one_one_learn/core/network/repositories/tutor_repository.dart';

part 'tutors_state.dart';

class TutorsCubit extends WidgetCubit<TutorsState> {
  TutorsCubit() : super(widgetState: const TutorsState());

  final numTutorsPerPage = 12;
  final tutorRepository = injector<TutorRepository>();
  final tutorsTextEditingController = TextEditingController();

  @override
  Future<void> onWidgetCreated() async {
    // refreshList();
  }

  List<TutorInfo?> get initialLoadMoreAbleList => <TutorInfo?>[null, null, null];

  void refreshList() {
    emit(state.copyWith(
      nextPage: 1,
      total: 0,
      listTutors: [],
    ));
  }

  bool canListTutorsLoadMore() {
    // return state.listTutors.length < state.total;
    return state.listTutors.last == null;
  }

  List<TutorInfo?> sortList(List<TutorInfo?> listSource, {
    required bool isDescending,
  }) {
    final listTutors = [...listSource]
      ..sort((a, b) {
        // sort by favorite status
        if (a?.isfavoritetutor == '1' && b?.isfavoritetutor != '1') {
          return -1;
        }
        if (a?.isfavoritetutor != '1' && b?.isfavoritetutor == '1') {
          return 1;
        }

        // sort by rating
        final compareValue =  (a?.rating?.toInt() ?? 0).compareTo(b?.rating?.toInt() ?? 0);
        return isDescending ? -compareValue : compareValue;
      });

    return listTutors;
  }

  List<TutorInfo?> getRealCurrentList({bool reloadAllCurrentList = false}) {
    final currentList = reloadAllCurrentList ? initialLoadMoreAbleList : [...state.listTutors];
    if (currentList.last == null) {
      currentList.removeRange(state.listTutors.length - 3, state.listTutors.length);
    }
    return currentList;
  }

  Future<void> searchListTutor({bool reloadAllCurrentList = false} ) async {
    emit(state.copyWith(isLoadingMore: true));

    // search list by the filters amd page number
    final tutorSearchResponse = await fetchApi<TutorSearchResponse>(
      () => tutorRepository.search(TutorSearchRequest(
        filters: state.filters,
        search: state.searchText,
        page: '${reloadAllCurrentList ? 1 : state.nextPage}',
        perPage: reloadAllCurrentList
            ? state.listTutors.length - (canListTutorsLoadMore() ? 3 : 0)
            : numTutorsPerPage,
      )),
      showLoading: false,
    );

    // handle the response
    print('currentListLength: ${
      state.listTutors.last == null ? state.listTutors.length - 3 : state.listTutors.length
    }');
    if (tutorSearchResponse != null) {
      if (tutorSearchResponse.statusCode == ApiStatusCode.success) {
        var newPage = state.nextPage;
        final newListTutors = tutorSearchResponse.rows ?? <TutorInfo?>[];
        var finalNewListTutors = <TutorInfo?>[];
        print('newListTutors: ${newListTutors.length}');
        if (reloadAllCurrentList) {
          // reload all current list --> replace current list with new list
          finalNewListTutors = sortList(newListTutors, isDescending: state.isDescending);
          if (canListTutorsLoadMore()) {
            finalNewListTutors.addAll([null, null, null]);
          }
        } else {
          // load more --> combine current list and new list
          newPage = state.nextPage + (newListTutors.isEmpty ? 0 : 1);
          final currentList = getRealCurrentList(reloadAllCurrentList: reloadAllCurrentList);
          finalNewListTutors = newListTutors.isEmpty ? [...currentList] : [...currentList, ...newListTutors];
          if (finalNewListTutors.length != currentList.length) {
            finalNewListTutors = sortList(
              finalNewListTutors, isDescending: state.isDescending,
            )..addAll([null, null, null]);
          }
        }
        print('finalNewListTutors: ${finalNewListTutors.length}');

        emit(state.copyWith(
          nextPage: newPage,
          total: tutorSearchResponse.count?.toInt() ?? 0,
          listTutors: [...finalNewListTutors],
        ));
      }
    } else {
      final currentList = getRealCurrentList(reloadAllCurrentList: reloadAllCurrentList);
      emit(state.copyWith(
        listTutors: [...currentList],
      ));
    }

    // // turn off new list loading state no matter what
    // emit(state.copyWith(
    //   isRefreshing: false,
    // ));
    emit(state.copyWith(isLoadingMore: false));
  }

  void onSearchTextSubmitted() {
    if (tutorsTextEditingController.text == state.searchText) {
      return;
    }

    emit(state.copyWith(
      searchText: tutorsTextEditingController.text,
      nextPage: 1, total: 0,
      listTutors: initialLoadMoreAbleList,
    ));
  }

  Future<void> onAddTutorToFavouriteList(String tutorId, int index) async {

  }

  @override
  Future<void> close() {
    tutorsTextEditingController.dispose();
    return super.close();
  }
}
