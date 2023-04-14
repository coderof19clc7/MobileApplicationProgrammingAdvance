/// id : "102ef671-a249-4d19-852e-ea23016d7d34"
/// userId : "cb9e7deb-3382-48db-b07c-90acf52f541c"
/// amount : "0"
/// isBlocked : false
/// createdAt : "2021-12-18T03:55:53.522Z"
/// updatedAt : "2021-12-18T03:55:53.522Z"
/// bonus : 0
class WalletInfo {
//<editor-fold desc="Data Methods">

  WalletInfo({
    this.id,
    this.userId,
    this.amount,
    this.isBlocked,
    this.createdAt,
    this.updatedAt,
    this.bonus,
  });

  WalletInfo.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    id = mapJson['id'] as String?;
    userId = mapJson['userId'] as String?;
    amount = mapJson['amount'] as String?;
    isBlocked = mapJson['isBlocked'] as bool?;
    createdAt = mapJson['createdAt'] as String?;
    updatedAt = mapJson['updatedAt'] as String?;
    bonus = mapJson['bonus'] as num?;
  }
  String? id;
  String? userId;
  String? amount;
  bool? isBlocked;
  String? createdAt;
  String? updatedAt;
  num? bonus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    map['amount'] = amount;
    map['isBlocked'] = isBlocked;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['bonus'] = bonus;
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is WalletInfo &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              userId == other.userId &&
              amount == other.amount &&
              isBlocked == other.isBlocked &&
              createdAt == other.createdAt &&
              updatedAt == other.updatedAt &&
              bonus == other.bonus);

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      amount.hashCode ^
      isBlocked.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      bonus.hashCode;

  @override
  String toString() {
    return 'WalletInfo{'
        ' id: $id,'
        ' userId: $userId,'
        ' amount: $amount,'
        ' isBlocked: $isBlocked,'
        ' createdAt: $createdAt,'
        ' updatedAt: $updatedAt,'
        ' bonus: $bonus,'
        ' }';
  }

  WalletInfo copyWith({
    String? id,
    String? userId,
    String? amount,
    bool? isBlocked,
    String? createdAt,
    String? updatedAt,
    num? bonus,
  }) {
    return WalletInfo(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      isBlocked: isBlocked ?? this.isBlocked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      bonus: bonus ?? this.bonus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'amount': amount,
      'isBlocked': isBlocked,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'bonus': bonus,
    };
  }

  factory WalletInfo.fromMap(Map<String, dynamic> map) {
    return WalletInfo(
      id: map['id'] as String?,
      userId: map['userId'] as String?,
      amount: map['amount'] as String?,
      isBlocked: map['isBlocked'] as bool?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      bonus: map['bonus'] as num?,
    );
  }

//</editor-fold>
}