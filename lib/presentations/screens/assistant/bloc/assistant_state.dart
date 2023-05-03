part of 'assistant_cubit.dart';

@immutable
class AssistantState extends WidgetState {
  final int sttInitializedStatus;
  final Locale? locale;
  final bool isWaitingNewMessage;
  final List<ChatMessageModel>? messageHistory;
  final bool isAutoplay;
  final int playingIndex;
  final String lastWords;
  final double soundLevel;
  final String currentLocaleId;

  @override
  WidgetState fromJson(json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

//<editor-fold desc="Data Methods">
  const AssistantState({
    super.isLoading = false,
    super.needNavigateToLogin = false,
    super.basicStatusFToastState,
    this.sttInitializedStatus = 0,
    this.locale,
    this.isWaitingNewMessage = false,
    this.messageHistory,
    this.isAutoplay = true,
    this.playingIndex = -1,
    this.lastWords = '',
    this.soundLevel = 0.0,
    this.currentLocaleId = '',
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is AssistantState &&
              runtimeType == other.runtimeType &&
              isLoading == other.isLoading &&
              needNavigateToLogin == other.needNavigateToLogin &&
              basicStatusFToastState == other.basicStatusFToastState &&
              sttInitializedStatus == other.sttInitializedStatus &&
              locale == other.locale &&
              isWaitingNewMessage == other.isWaitingNewMessage &&
              messageHistory == other.messageHistory &&
              isAutoplay == other.isAutoplay &&
              playingIndex == other.playingIndex &&
              lastWords == other.lastWords &&
              soundLevel == other.soundLevel &&
              currentLocaleId == other.currentLocaleId);

  @override
  int get hashCode =>
      isLoading.hashCode ^
      needNavigateToLogin.hashCode ^
      basicStatusFToastState.hashCode ^
      sttInitializedStatus.hashCode ^
      locale.hashCode ^
      isWaitingNewMessage.hashCode ^
      messageHistory.hashCode ^
      isAutoplay.hashCode ^
      playingIndex.hashCode ^
      lastWords.hashCode ^
      soundLevel.hashCode ^
      currentLocaleId.hashCode;

  @override
  String toString() {
    return 'AssistantState{'
        ' isLoading: $isLoading,'
        ' needNavigateToLogin: $needNavigateToLogin,'
        ' basicStatusFToastState: $basicStatusFToastState,'
        ' sttInitializedStatus: $sttInitializedStatus,'
        ' locale: $locale,'
        ' isWaitingNewMessage: $isWaitingNewMessage,'
        ' messageHistory: $messageHistory,'
        ' isAutoplay: $isAutoplay,'
        ' playingIndex: $playingIndex,'
        ' lastWords: $lastWords,'
        ' soundLevel: $soundLevel,'
        ' currentLocaleId: $currentLocaleId,'
        ' }';
  }

  AssistantState copyWith({
    bool? isLoading,
    bool? needNavigateToLogin,
    BasicStatusFToastState? basicStatusFToastState,
    int? sttInitializedStatus,
    Locale? locale,
    bool? isWaitingNewMessage,
    List<ChatMessageModel>? messageHistory,
    bool? isAutoplay,
    int? playingIndex,
    String? lastWords,
    double? soundLevel,
    String? currentLocaleId,
  }) {
    return AssistantState(
      isLoading: isLoading ?? this.isLoading,
      needNavigateToLogin: needNavigateToLogin ?? this.needNavigateToLogin,
      basicStatusFToastState: basicStatusFToastState ?? this.basicStatusFToastState,
      sttInitializedStatus: sttInitializedStatus ?? this.sttInitializedStatus,
      locale: locale ?? this.locale,
      isWaitingNewMessage: isWaitingNewMessage ?? this.isWaitingNewMessage,
      messageHistory: messageHistory ?? this.messageHistory,
      isAutoplay: isAutoplay ?? this.isAutoplay,
      playingIndex: playingIndex ?? this.playingIndex,
      lastWords: lastWords ?? this.lastWords,
      soundLevel: soundLevel ?? this.soundLevel,
      currentLocaleId: currentLocaleId ?? this.currentLocaleId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'needNavigateToLogin': needNavigateToLogin,
      'basicStatusFToastState': basicStatusFToastState,
      'sttInitializedStatus': sttInitializedStatus,
      'locale': locale,
      'isWaitingNewMessage': isWaitingNewMessage,
      'messageHistory': messageHistory,
      'isAutoplay': isAutoplay,
      'playingIndex': playingIndex,
      'lastWords': lastWords,
      'soundLevel': soundLevel,
      'currentLocaleId': currentLocaleId,
    };
  }

  factory AssistantState.fromMap(Map<String, dynamic> map) {
    return AssistantState(
      isLoading: map['isLoading'] as bool,
      needNavigateToLogin: map['needNavigateToLogin'] as bool,
      basicStatusFToastState: map['basicStatusFToastState'] as BasicStatusFToastState,
      sttInitializedStatus: map['sttInitializedStatus'] as int,
      locale: map['locale'] as Locale,
      isWaitingNewMessage: map['isWaitingNewMessage'] as bool,
      messageHistory: map['messageHistory'] as List<ChatMessageModel>,
      isAutoplay: map['isAutoplay'] as bool,
      playingIndex: map['playingIndex'] as int,
      lastWords: map['lastWords'] as String,
      soundLevel: map['soundLevel'] as double,
      currentLocaleId: map['currentLocaleId'] as String,
    );
  }

//</editor-fold>
}
