import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'response_model.freezed.dart';
part 'response_model.g.dart';

@freezed
class ResponseModel with _$ResponseModel {
  const factory ResponseModel({
    required int posText,
    required int posCategory,
    required String genre,
  }) = _ResponseModel;

  factory ResponseModel.newObject() {
    return const ResponseModel(posText: 0, posCategory: 0, genre: '');
  }

  factory ResponseModel.fromJson(Map<String, Object?> json) =>
      _$ResponseModelFromJson(json);
}
