// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_space_effort.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkSpaceEffort _$WorkSpaceEffortFromJson(Map<String, dynamic> json) => WorkSpaceEffort(
      id: json['id'] as int?,
      label: (json['label'] as List<dynamic>?)?.map((e) => e as String).toList(),
      value: json['value'] == null ? null : WorkSpaceEffortValue.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkSpaceEffortToJson(WorkSpaceEffort instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'value': instance.value,
    };
