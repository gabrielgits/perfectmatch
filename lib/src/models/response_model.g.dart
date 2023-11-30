// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseModelImpl _$$ResponseModelImplFromJson(Map<String, dynamic> json) =>
    _$ResponseModelImpl(
      posText: json['posText'] as int,
      posCategory: json['posCategory'] as int,
      genre: json['genre'] as String,
    );

Map<String, dynamic> _$$ResponseModelImplToJson(_$ResponseModelImpl instance) =>
    <String, dynamic>{
      'posText': instance.posText,
      'posCategory': instance.posCategory,
      'genre': instance.genre,
    };
