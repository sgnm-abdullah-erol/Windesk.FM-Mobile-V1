// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_space_effort_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkSpaceEffortValue _$WorkSpaceEffortValueFromJson(Map<String, dynamic> json) => WorkSpaceEffortValue(
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      effortDuration: json['effortDuration'] as String?,
      description: json['description'] as String?,
      effortType: json['effortType'] as String?,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$WorkSpaceEffortValueToJson(WorkSpaceEffortValue instance) => <String, dynamic>{
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'effortDuration': instance.effortDuration,
      'description': instance.description,
      'effortType': instance.effortType,
      'user': instance.user,
    };
