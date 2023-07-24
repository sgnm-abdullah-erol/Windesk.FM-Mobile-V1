// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_space_efforts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkSpaceEfforts _$WorkSpaceEffortsFromJson(Map<String, dynamic> json) => WorkSpaceEfforts(
      id: json['id'] as int?,
      label: (json['label'] as List<dynamic>?)?.map((e) => e as String).toList(),
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      effortDuration: json['effortDuration'] as String?,
      description: json['description'] as String?,
      effortType: json['effortType'] as String?,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$WorkSpaceEffortsToJson(WorkSpaceEfforts instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'effortDuration': instance.effortDuration,
      'description': instance.description,
      'effortType': instance.effortType,
      'user': instance.user,
    };
