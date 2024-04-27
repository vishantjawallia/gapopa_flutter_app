class UserModel {
  final String? id;
  final String? name;
  const UserModel({this.id, this.name});
  UserModel copyWith({String? id, String? name}) {
    return UserModel(id: id ?? this.id, name: name ?? this.name);
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'name': name};
  }

  static UserModel fromJson(Map<String, Object?> json) {
    return UserModel(id: json['id'] == null ? null : json['id'] as String, name: json['name'] == null ? null : json['name'] as String);
  }

  @override
  String toString() {
    return '''UserModel(
                id:$id,
name:$name
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is UserModel && other.runtimeType == runtimeType && other.id == id && other.name == name;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name);
  }
}
