import 'package:flutter/foundation.dart';

class BaseModel<E> {
  final bool? success;
  final String? msg;
  final E? data;
  const BaseModel({
    required this.success,
    required this.msg,
    required this.data,
  });
  BaseModel copyWith({
    bool? success,
    String? msg,
    dynamic data,
  }) {
    if (success == false) {
      if (kDebugMode) print("$msg");
    }
    return BaseModel(
      success: success ?? this.success,
      msg: msg ?? this.msg,
      data: data ?? this.data,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'success': success,
      'msg': msg,
      'data': data,
    };
  }

  static BaseModel fromJson(Map<String, Object?> json) {
    return BaseModel(
      success: json['success'] == null ? null : json['success'] as bool,
      msg: json['msg'] == null ? null : json['msg'] as String,
      data: json['data'] as dynamic,
    );
  }

  @override
  String toString() {
    return '''BaseModel(
            success:$success,
            msg:$msg,
            data:$data
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is BaseModel && other.runtimeType == runtimeType && other.success == success && other.msg == msg && other.data == data;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, success, msg, data);
  }
}
