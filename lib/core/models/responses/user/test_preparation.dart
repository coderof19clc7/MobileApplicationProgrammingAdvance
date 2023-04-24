class TestPreparation {

//<editor-fold desc="Data Methods">
  TestPreparation({
    this.id,
    this.key,
    this.name,
  });

  TestPreparation.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    id = mapJson['id'] as num?;
    key = mapJson['key'] as String?;
    name = mapJson['name'] as String?;
  }

  num? id;
  String? key;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['key'] = key;
    map['name'] = name;
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TestPreparation &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          key == other.key &&
          name == other.name);

  @override
  int get hashCode => id.hashCode ^ key.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'TestPreparation{'
        ' id: $id,'
        ' key: $key,'
        ' name: $name,'
        ' }';
  }

  TestPreparation copyWith({
    num? id,
    String? key,
    String? name,
  }) {
    return TestPreparation(
      id: id ?? this.id,
      key: key ?? this.key,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'key': key,
      'name': name,
    };
  }

  factory TestPreparation.fromMap(Map<String, dynamic> map) {
    return TestPreparation(
      id: map['id'] as num?,
      key: map['key'] as String?,
      name: map['name'] as String?,
    );
  }

//</editor-fold>
}
