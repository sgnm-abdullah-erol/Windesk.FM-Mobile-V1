// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_space_user_groups.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkSpaceUserGroups _$WorkSpaceUserGroupsFromJson(Map<String, dynamic> json) =>
    WorkSpaceUserGroups(
      id: json['id'] as int?,
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$WorkSpaceUserGroupsToJson(
        WorkSpaceUserGroups instance) =>
    <String, dynamic>{
      'id': instance.id,
      'labels': instance.labels,
      'name': instance.name,
    };
