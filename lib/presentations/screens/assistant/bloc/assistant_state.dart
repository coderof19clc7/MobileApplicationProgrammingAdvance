part of 'assistant_cubit.dart';

enum SendErrorType {none, notApiKey, apiKey, priApiKey}

@immutable
class AssistantState extends WidgetState {
  final int sttInitializedStatus;
  final Locale? locale;
  final bool isWaitingNewMessage;
  final bool usingPrivateApiKey;
  final List<ChatMessageModel>? messageHistory;
  final bool isAutoplay;
  final int playingIndex;
  final String lastWords;
  final double soundLevel;
  final String currentLocaleId;
  final SendErrorType sendErrorType;

  @override
  List<Object?> get props => [
    ...super.props,
    sttInitializedStatus,
    locale,
    isWaitingNewMessage,
    usingPrivateApiKey,
    messageHistory,
    isAutoplay,
    playingIndex,
    lastWords,
    soundLevel,
    currentLocaleId,
  ];

  @override
  WidgetState fromJson(json) {
    final mapJson = json as Map<String, dynamic>;
    return AssistantState(
      isLoading: mapJson['isLoading'] as bool? ?? false,
      needNavigateToLogin: mapJson['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: mapJson['basicStatusFToastState'] as BasicStatusFToastState?,
      sttInitializedStatus: mapJson['sttInitializedStatus'] as int? ?? 0,
      locale: mapJson['locale'] as Locale?,
      isWaitingNewMessage: mapJson['isWaitingNewMessage'] as bool? ?? false,
      usingPrivateApiKey: mapJson['usingPrivateApiKey'] as bool? ?? false,
      messageHistory: mapJson['messageHistory'] as List<ChatMessageModel>?,
      isAutoplay: mapJson['isAutoplay'] as bool? ?? true,
      playingIndex: mapJson['playingIndex'] as int? ?? -1,
      lastWords: mapJson['lastWords'] as String? ?? '',
      soundLevel: mapJson['soundLevel'] as double? ?? 0,
      currentLocaleId: mapJson['currentLocaleId'] as String? ?? '',
      sendErrorType: SendErrorType.values[mapJson['sendErrorType'] as int? ?? 0],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isLoading'] = isLoading;
    map['needNavigateToLogin'] = needNavigateToLogin;
    map['basicStatusFToastState'] = basicStatusFToastState;
    map['sttInitializedStatus'] = sttInitializedStatus;
    map['locale'] = locale;
    map['isWaitingNewMessage'] = isWaitingNewMessage;
    map['usingPrivateApiKey'] = usingPrivateApiKey;
    map['messageHistory'] = messageHistory;
    map['isAutoplay'] = isAutoplay;
    map['playingIndex'] = playingIndex;
    map['lastWords'] = lastWords;
    map['soundLevel'] = soundLevel;
    map['currentLocaleId'] = currentLocaleId;
    map['sendErrorType'] = sendErrorType.index;
    return map;
  }

//<editor-fold desc="Data Methods">
  const AssistantState({
    super.isLoading = false,
    super.needNavigateToLogin = false,
    super.basicStatusFToastState,
    this.sttInitializedStatus = 0,
    this.locale,
    this.isWaitingNewMessage = false,
    this.usingPrivateApiKey = false,
    this.messageHistory,
    this.isAutoplay = true,
    this.playingIndex = -1,
    this.lastWords = '',
    this.soundLevel = 0.0,
    this.currentLocaleId = '',
    this.sendErrorType = SendErrorType.none,
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
              usingPrivateApiKey == other.usingPrivateApiKey &&
              listEquals(messageHistory, other.messageHistory) &&
              isAutoplay == other.isAutoplay &&
              playingIndex == other.playingIndex &&
              lastWords == other.lastWords &&
              soundLevel == other.soundLevel &&
              currentLocaleId == other.currentLocaleId &&
              sendErrorType == other.sendErrorType);

  @override
  int get hashCode =>
      isLoading.hashCode ^
      needNavigateToLogin.hashCode ^
      basicStatusFToastState.hashCode ^
      sttInitializedStatus.hashCode ^
      locale.hashCode ^
      isWaitingNewMessage.hashCode ^
      usingPrivateApiKey.hashCode ^
      messageHistory.hashCode ^
      isAutoplay.hashCode ^
      playingIndex.hashCode ^
      lastWords.hashCode ^
      soundLevel.hashCode ^
      currentLocaleId.hashCode ^
      sendErrorType.hashCode;

  @override
  String toString() {
    return 'AssistantState{'
        ' isLoading: $isLoading,'
        ' needNavigateToLogin: $needNavigateToLogin,'
        ' basicStatusFToastState: $basicStatusFToastState,'
        ' sttInitializedStatus: $sttInitializedStatus,'
        ' locale: $locale,'
        ' isWaitingNewMessage: $isWaitingNewMessage,'
        ' usingPrivateApiKey: $usingPrivateApiKey,'
        ' messageHistory: $messageHistory,'
        ' isAutoplay: $isAutoplay,'
        ' playingIndex: $playingIndex,'
        ' lastWords: $lastWords,'
        ' soundLevel: $soundLevel,'
        ' currentLocaleId: $currentLocaleId,'
        ' sendErrorType: $sendErrorType,'
        ' }';
  }

  AssistantState copyWith({
    bool? isLoading,
    bool? needNavigateToLogin,
    BasicStatusFToastState? basicStatusFToastState,
    int? sttInitializedStatus,
    Locale? locale,
    bool? isWaitingNewMessage,
    bool? usingPrivateApiKey,
    List<ChatMessageModel>? messageHistory,
    bool? isAutoplay,
    int? playingIndex,
    String? lastWords,
    double? soundLevel,
    String? currentLocaleId,
    SendErrorType? sendErrorType,
  }) {
    return AssistantState(
      isLoading: isLoading ?? this.isLoading,
      needNavigateToLogin: needNavigateToLogin ?? this.needNavigateToLogin,
      basicStatusFToastState: basicStatusFToastState ?? this.basicStatusFToastState,
      sttInitializedStatus: sttInitializedStatus ?? this.sttInitializedStatus,
      locale: locale ?? this.locale,
      isWaitingNewMessage: isWaitingNewMessage ?? this.isWaitingNewMessage,
      usingPrivateApiKey: usingPrivateApiKey ?? this.usingPrivateApiKey,
      messageHistory: messageHistory ?? this.messageHistory,
      isAutoplay: isAutoplay ?? this.isAutoplay,
      playingIndex: playingIndex ?? this.playingIndex,
      lastWords: lastWords ?? this.lastWords,
      soundLevel: soundLevel ?? this.soundLevel,
      currentLocaleId: currentLocaleId ?? this.currentLocaleId,
      sendErrorType: sendErrorType ?? this.sendErrorType,
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
      'usingPrivateApiKey': usingPrivateApiKey,
      'messageHistory': messageHistory,
      'isAutoplay': isAutoplay,
      'playingIndex': playingIndex,
      'lastWords': lastWords,
      'soundLevel': soundLevel,
      'currentLocaleId': currentLocaleId,
      'sendErrorType': sendErrorType.index,
    };
  }

  factory AssistantState.fromMap(Map<String, dynamic> map) {
    return AssistantState(
      isLoading: map['isLoading'] as bool? ?? false,
      needNavigateToLogin: map['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: map['basicStatusFToastState'] as BasicStatusFToastState,
      sttInitializedStatus: map['sttInitializedStatus'] as int? ?? 0,
      locale: map['locale'] as Locale?,
      isWaitingNewMessage: map['isWaitingNewMessage'] as bool? ?? false,
      usingPrivateApiKey: map['usingPrivateApiKey'] as bool? ?? false,
      messageHistory: map['messageHistory'] as List<ChatMessageModel>,
      isAutoplay: map['isAutoplay'] as bool? ?? true,
      playingIndex: map['playingIndex'] as int? ?? -1,
      lastWords: map['lastWords'] as String? ?? '',
      soundLevel: map['soundLevel'] as double? ?? 0,
      currentLocaleId: map['currentLocaleId'] as String? ?? '',
      sendErrorType: SendErrorType.values[map['sendErrorType'] as int? ?? 0],
    );
  }

//</editor-fold>
}
