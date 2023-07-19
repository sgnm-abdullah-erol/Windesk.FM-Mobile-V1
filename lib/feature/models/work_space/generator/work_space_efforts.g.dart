// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_space_efforts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkSpaceEfforts _$WorkSpaceEffortsFromJson(Map<String, dynamic> json) => WorkSpaceEfforts(
      requestedBy: (json['requestedBy'] as List<dynamic>?)?.map((e) => CreatedBy.fromJson(e as Map<String, dynamic>)).toList(),
      requestedSpaces: (json['requestedSpaces'] as List<dynamic>?)?.map((e) => CreatedBy.fromJson(e as Map<String, dynamic>)).toList(),
      createdBy: (json['createdBy'] as List<dynamic>?)?.map((e) => CreatedBy.fromJson(e as Map<String, dynamic>)).toList(),
      effort: (json['effort'] as List<dynamic>?)?.map((e) => WorkSpaceEffort.fromJson(e as Map<String, dynamic>)).toList(),
      templatedBy: json['templatedBy'] as String?,
      woCategory: json['woCategory'] as String?,
      woCategoryName: json['woCategoryName'] as String?,
      requestType: json['requestType'] as String?,
      requestTypeName: json['requestTypeName'] as String?,
      priority: json['priority'] as String?,
      priorityName: json['priorityName'] as String?,
      appointmentDate: json['appointmentDate'] == null ? null : DateTime.parse(json['appointmentDate'] as String),
      description: json['description'] as String?,
      dueDate: json['dueDate'] == null ? null : DateTime.parse(json['dueDate'] as String),
      name: json['name'] as String?,
      templatedByName: json['templatedByName'] as String?,
    );

Map<String, dynamic> _$WorkSpaceEffortsToJson(WorkSpaceEfforts instance) => <String, dynamic>{
      'requestedBy': instance.requestedBy,
      'requestedSpaces': instance.requestedSpaces,
      'createdBy': instance.createdBy,
      'effort': instance.effort,
      'templatedBy': instance.templatedBy,
      'woCategory': instance.woCategory,
      'woCategoryName': instance.woCategoryName,
      'requestType': instance.requestType,
      'requestTypeName': instance.requestTypeName,
      'priority': instance.priority,
      'priorityName': instance.priorityName,
      'appointmentDate': instance.appointmentDate?.toIso8601String(),
      'description': instance.description,
      'dueDate': instance.dueDate?.toIso8601String(),
      'name': instance.name,
      'templatedByName': instance.templatedByName,
    };
