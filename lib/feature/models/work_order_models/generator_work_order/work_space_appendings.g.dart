// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../work_space/work_space_appendings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkSpaceAppendings _$WorkSpaceAppendingsFromJson(Map<String, dynamic> json) => WorkSpaceAppendings(
      json['workspace'] == null ? null : Workspace.fromJson(json['workspace'] as Map<String, dynamic>),
      json['task'] == null ? null : Task.fromJson(json['task'] as Map<String, dynamic>),
      json['state'] == null ? null : State.fromJson(json['state'] as Map<String, dynamic>),
      json['calendar'] == null ? null : Calendar.fromJson(json['calendar'] as Map<String, dynamic>),
      json['totalCount'] == null ? null : TotalCount.fromJson(json['totalCount'] as Map<String, dynamic>),
      json['workSpaceUserInformation'] == null ? null : WorkSpaceUserInformation.fromJson(json['workSpaceUserInformation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkSpaceAppendingsToJson(WorkSpaceAppendings instance) => <String, dynamic>{
      'workspace': instance.workspace,
      'task': instance.task,
      'state': instance.state,
      'calendar': instance.calendar,
      'totalCount': instance.totalCount,
      'workSpaceUserInformation': instance.workSpaceUserInformation,
    };
