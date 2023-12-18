// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_check_list_value_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartCheckListValueModel _$StartCheckListValueModelFromJson(
        Map<String, dynamic> json) =>
    StartCheckListValueModel(
      (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['id'] as int?,
      json['key'] as String?,
    );

Map<String, dynamic> _$StartCheckListValueModelToJson(
        StartCheckListValueModel instance) =>
    <String, dynamic>{
      'labels': instance.labels,
      'id': instance.id,
      'key': instance.key,
    };
