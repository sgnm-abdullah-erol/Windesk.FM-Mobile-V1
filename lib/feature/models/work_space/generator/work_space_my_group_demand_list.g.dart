// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_space_my_group_demand_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkSpaceMyGroupDemandList _$MyGroupDemandListFromJson(Map<String, dynamic> json) => WorkSpaceMyGroupDemandList(
      id: json['id'] as int?,
      name: json['name'] as String?,
      taskCount: json['taskCount'] as int?,
      children: (json['children'] as List<dynamic>?)?.map((e) => WorkSpaceMyGroupDemandList.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$MyGroupDemandListToJson(WorkSpaceMyGroupDemandList instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'taskCount': instance.taskCount,
      'children': instance.children,
    };
