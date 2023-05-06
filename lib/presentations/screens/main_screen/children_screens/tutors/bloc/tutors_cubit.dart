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
import 'package:one_one_learn/generated/l10n.dart';

part 'tutors_state.dart';

class TutorsCubit extends WidgetCubit<TutorsState> {
  TutorsCubit._() : super(widgetState: TutorsState(filters: Filters.defaultFilters()));

  final numTutorsPerPage = 12;
  final tutorRepository = injector<TutorRepository>();
  final userRepository = injector<UserRepository>();
  TextEditingController? tutorsTextEditingController;
  ScrollController? tutorsScrollController;

  // constants
  final nationalitiesMap = {
    0: S.current.all,
    1: S.current.foreign,
    2: S.current.vietnamese,
    3: S.current.nativeEnglish,
  };
  final sortMap = {
    0: S.current.sortNameFromAtoZ,
    1: S.current.sortSomethingsFromLow(S.current.rating.toLowerCase()),
    -1: S.current.sortSomethingsFromHigh(S.current.rating.toLowerCase()),
  };

  static TutorsCubit? _instance;
  static TutorsCubit getInstance() {
    if (kDebugMode) {
      print('TutorsCubit _instance?.isClosed: ${_instance?.isClosed}');
    }
    if (_instance == null || _instance?.isClosed == true) {
      if (kDebugMode) {
        var text = '';
        if (_instance == null) {
          text += '_instance is null, ';
        }
        if (_instance?.isClosed == true) {
          text += '_instance is closed, set to null and ';
          _instance = null;
        }
        print('$text create new _instance of TutorsCubit');
      }
      _instance = TutorsCubit._();
      _instance?.tutorsTextEditingController = TextEditingController();
      _instance?.tutorsScrollController = ScrollController();
    }
    return _instance!;
  }

  @override
  Future<void> onWidgetCreated() async {
    // emit(state.copyWith(filters: Filters.defaultFilters()));
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

  List<String> getCurrentSpecialties() {
    final specialties = state.filters?.specialties ?? <String>[];
    return specialties;
  }
  List<int> getCurrentNationalities() {
    return state.nationalityValues;
  }

  bool canListTutorsLoadMore() {
    // return state.listTutors.length < state.total;
    if (state.listTutors.isEmpty) {
      return false;
    }
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

  List<TutorInfo?> getRealCurrentList() {
    final currentList = [...state.listTutors];
    if (canListTutorsLoadMore()) {
      currentList.removeRange(state.listTutors.length - 3, state.listTutors.length);
    }
    return currentList;
  }

  Future<void> searchListTutors({bool reloadAllCurrentList = false}) async {
    emit(state.copyWith(isLoadingMore: true));

    // search list by the filters amd page number
    final tutorSearchResponse = await fetchApi<TutorSearchResponse>(
      () => tutorRepository.search(TutorSearchRequest(
        filters: state.filters,
        search: state.searchText,
        page: '${reloadAllCurrentList ? 1 : state.nextPage}',
        perPage: reloadAllCurrentList
            ? state.nextPage * numTutorsPerPage
            : numTutorsPerPage,
      )),
      showLoading: false,
    );

    // handle the response
    if (kDebugMode) {
      print('currentListLength: ${
      canListTutorsLoadMore() ? state.listTutors.length - 3 : state.listTutors.length
    }');
    }
    if (tutorSearchResponse != null) {
      if (tutorSearchResponse.statusCode == ApiStatusCode.success) {
        var newPage = state.nextPage;
        final newListTutors = tutorSearchResponse.rows ?? <TutorInfo?>[];
        if (newListTutors.isNotEmpty) {
          final removeRange = newPage * numTutorsPerPage - getRealCurrentList().length;
          newListTutors.removeRange(
            0, removeRange < numTutorsPerPage ? numTutorsPerPage - removeRange : 0,
          );
        }
        var finalNewListTutors = <TutorInfo?>[];
        if (kDebugMode) {
          print('newListTutors: ${newListTutors.length}');
        }
        if (reloadAllCurrentList) {
          // reload all current list --> replace current list with new list
          finalNewListTutors = sortList(newListTutors, sortValue: state.sortValue)
          ..addAll([null, null, null]);
        } else {
          // load more --> combine current list and new list
          final currentList = getRealCurrentList();
          finalNewListTutors = newListTutors.isEmpty ? [...currentList] : [...currentList, ...newListTutors];
          if (finalNewListTutors.length != currentList.length) {
            finalNewListTutors = sortList(
              finalNewListTutors, sortValue: state.sortValue,
            )..addAll([null, null, null]);
          }
        }
        if (kDebugMode) {
          print('finalNewListTutors: ${finalNewListTutors.length}');
        }
        if (finalNewListTutors.length >= newPage * numTutorsPerPage) {
          newPage += 1;
        }

        emit(state.copyWith(
          nextPage: newPage,
          total: tutorSearchResponse.count?.toInt() ?? 0,
          listTutors: [...finalNewListTutors],
        ));
      } else {
        emit(state.copyWith(
          listTutors: [...getRealCurrentList()],
        ));
      }
    } else {
      emit(state.copyWith(
        listTutors: [...getRealCurrentList()],
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

  void onSearchTextSubmitted2(String value) {
    if (value == state.searchText) {
      return;
    }

    if (tutorsScrollController?.hasClients == true) {
      tutorsScrollController?.jumpTo(0);
    }

    emit(state.copyWith(
      searchText: value,
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

  void onApplyFilters2(List<String> newSpecialities, List<int> newNationalityValues, int newSortValue) {
    // only apply new filters if they are different from the current ones
    if (listEquals(newSpecialities, getCurrentSpecialties())
        && listEquals(newNationalityValues, getCurrentNationalities())
        && newSortValue == state.sortValue
    ) {
      return;
    }

    var newFilters = state.filters?.copyWith();
    // convert new filters into Filters object if there is a change
    if (!listEquals(newSpecialities, getCurrentSpecialties())
        || !listEquals(newNationalityValues, getCurrentNationalities())
    ) {
      var currentNationality = state.filters?.nationality?.copyWith();
      if (newNationalityValues != getCurrentNationalities()) {
        if (newNationalityValues.isEmpty) {
          currentNationality = Nationality();
        } else if (newNationalityValues.contains(1)) {
          currentNationality = Nationality(
            isVietNamese: newNationalityValues.contains(2) ? null : false,
            isNative: newNationalityValues.contains(3) ? null : false,
          );
        } else {
          currentNationality = Nationality(
            isVietNamese: newNationalityValues.contains(2) ? true : null,
            isNative: newNationalityValues.contains(3) ? true : null,
          );
        }
      }

      newFilters = Filters(
        specialties: newSpecialities,
        nationality: currentNationality,
      );
    }

    if (tutorsScrollController?.hasClients == true) {
      tutorsScrollController?.jumpTo(0);
    }

    emit(state.copyWith(
      nextPage: 1, total: 0,
      listTutors: initialLoadMoreAbleList,
      filters: newFilters,
      nationalityValues: newNationalityValues,
      sortValue: newSortValue,
    ));
  }

  Future<void> onTutorFavouriteStatusChanged(String tutorId, {
    int index = -1,
    void Function(bool newStatus)? onCompleted,
  }) async {
    changeLoadingState(isLoading: true);
    final userManageFavouriteTutorResponse = await fetchApi<UserManageFavoriteTutorResponse>(
      () => userRepository.manageFavoriteTutor(tutorId),
      showLoading: false,
    );

    if (userManageFavouriteTutorResponse != null) {
      if (userManageFavouriteTutorResponse.statusCode == ApiStatusCode.success
        && userManageFavouriteTutorResponse.result != null
      ) {
        final isNowFavorite = userManageFavouriteTutorResponse.result is! int;
        var trueIndex = index;
        if (trueIndex == -1) {
          trueIndex = state.listTutors.indexWhere((element) => element?.id == tutorId);
        }
        if (trueIndex == -1) {
          await searchListTutors(reloadAllCurrentList: true);
        } else {
          final newList = [...state.listTutors];
          newList[index] = newList[index]?.copyWith(
            isfavoritetutor: !isNowFavorite ? '0' : '1',
          );
          emit(state.copyWith(
            listTutors: sortList(newList, sortValue: state.sortValue),
          ));
        }
        if (onCompleted != null) {
          onCompleted.call(isNowFavorite);
        }
      }
    }
    changeLoadingState(isLoading: false);
  }

  @override
  Future<void> close() async {
    tutorsTextEditingController?.dispose();
    tutorsScrollController?.dispose();
    super.close();
    if (_instance?.isClosed == true) {
      if (kDebugMode) {
        print('TutorsCubit _instance is closed --> set to null');
      }
      _instance = null;
    }
  }
}
