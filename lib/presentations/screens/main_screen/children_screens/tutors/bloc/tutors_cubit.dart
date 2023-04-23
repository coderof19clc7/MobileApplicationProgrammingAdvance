import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/requests/tutor/tutor_search_request.dart';
import 'package:one_one_learn/core/models/responses/tutor/tutor_info.dart';
import 'package:one_one_learn/core/models/responses/tutor/tutor_search_response.dart';
import 'package:one_one_learn/core/models/responses/user/user_manage_favorite_tutor_response.dart';
import 'package:one_one_learn/core/network/repositories/tutor_repository.dart';
import 'package:one_one_learn/core/network/repositories/user_repository.dart';

part 'tutors_state.dart';

class TutorsCubit extends WidgetCubit<TutorsState> {
  TutorsCubit._() : super(widgetState: const TutorsState());

  final numTutorsPerPage = 12;
  final tutorRepository = injector<TutorRepository>();
  final userRepository = injector<UserRepository>();
  TextEditingController? tutorsTextEditingController;

  static TutorsCubit? _instance;
  static TutorsCubit getInstance() {
    if (kDebugMode) {
      print('TutorsCubit _instance?.isClosed: ${_instance?.isClosed}');
    }
    if (_instance == null || _instance!.isClosed) {
      if (kDebugMode) {
        print('create new _instance of TutorsCubit');
      }
      _instance = TutorsCubit._();
      _instance?.tutorsTextEditingController = TextEditingController();
    }
    return _instance!;
  }

  @override
  Future<void> onWidgetCreated() async {
    emit(state.copyWith(filters: Filters.defaultFilters()));
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
    required int sortValue,
  }) {
    final listTutors = [...listSource]
      ..sort((a, b) {
        // a always stand before b if b is null
        if (b == null) {
          return - 1;
        }
        // b always stand before a if a is null
        if (a == null) {
          return 1;
        }

        // sort by favorite status
        if (a.isfavoritetutor == '1' && b.isfavoritetutor != '1') {
          return -1;
        }
        if (a.isfavoritetutor != '1' && b.isfavoritetutor == '1') {
          return 1;
        }

        if (sortValue == 0) {
          return a.name?.compareTo(b.name ?? '') ?? 0;
        }

        // sort by rating
        final compareValue =  (a.rating?.toInt() ?? 0).compareTo(b.rating?.toInt() ?? 0);
        return sortValue == -1 ? -compareValue : compareValue;
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
          finalNewListTutors = sortList(newListTutors, sortValue: state.sortValue);
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
              finalNewListTutors, sortValue: state.sortValue,
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
    if (tutorsTextEditingController?.text == state.searchText) {
      return;
    }

    emit(state.copyWith(
      searchText: tutorsTextEditingController?.text,
      nextPage: 1, total: 0,
      listTutors: initialLoadMoreAbleList,
    ));
  }

  void onApplyFilters(Filters newFilters, int newSortValue) {
    // only apply new filters if they are different from the current ones
    if (newFilters == state.filters && newSortValue == state.sortValue) {
      return;
    }
    if (newFilters != state.filters) {
      emit(state.copyWith(
        nextPage: 1, total: 0,
        listTutors: initialLoadMoreAbleList,
        filters: newFilters,
        sortValue: newSortValue,
      ));
    } else if (newSortValue != state.sortValue) {
      emit(state.copyWith(
        listTutors: sortList([...state.listTutors], sortValue: newSortValue),
        sortValue: newSortValue,
      ));
    }

  }

  Future<void> onTutorFavouriteStatusChanged(String tutorId, {
    int index = -1,
  }) async {
    changeLoadingState(isLoading: true);
    final userManageFavouriteTutorResponse = await fetchApi<UserManageFavoriteTutorResponse>(
      () => userRepository.manageFavoriteTutor(tutorId),
      showLoading: false,
    );

    if (userManageFavouriteTutorResponse != null) {
      if (userManageFavouriteTutorResponse.statusCode == ApiStatusCode.success) {
        if (index == -1) {
          await searchListTutor(reloadAllCurrentList: true);
        } else {
          final newList = [...getRealCurrentList()];
          newList[index] = newList[index]?.copyWith(
            isfavoritetutor: newList[index]?.isfavoritetutor == '1' ? '0' : '1',
          );
          emit(state.copyWith(
            listTutors: sortList(newList, sortValue: state.sortValue),
          ));
        }
      }
    }
    changeLoadingState(isLoading: false);
  }

  @override
  Future<void> close() async {
    tutorsTextEditingController?.dispose();
    super.close();
    if (_instance?.isClosed == true) {
      if (kDebugMode) {
        print('TutorsCubit _instance is closed --> set to null');
      }
      _instance = null;
    }
  }
}
