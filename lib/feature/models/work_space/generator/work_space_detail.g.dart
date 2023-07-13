// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_space_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkSpaceDetail _$WorkSpaceDetailFromJson(Map<String, dynamic> json) => WorkSpaceDetail(
      workspace: json['workspace'] == null ? null : Workspace.fromJson(json['workspace'] as Map<String, dynamic>),
      task: json['task'] == null ? null : Task.fromJson(json['task'] as Map<String, dynamic>),
      state: json['state'] == null ? null : State.fromJson(json['state'] as Map<String, dynamic>),
      calendar: json['calendar'] == null ? null : Calendar.fromJson(json['calendar'] as Map<String, dynamic>),
      totalCount: json['totalCount'] == null ? null : TotalCount.fromJson(json['totalCount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkSpaceDetailToJson(WorkSpaceDetail instance) => <String, dynamic>{
      'workspace': instance.workspace,
      'task': instance.task,
      'state': instance.state,
      'calendar': instance.calendar,
      'totalCount': instance.totalCount,
    };
