// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_space_next_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NextState _$NextStateFromJson(Map<String, dynamic> json) => NextState(
      canDisplay: json['canDisplay'] as bool?,
      description: json['description'] as String?,
      className: json['className'] as String?,
      isActive: json['isActive'] as bool?,
      trId: json['trId'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      isDefault: json['isDefault'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      isFinalState: json['isFinalState'] as bool?,
      mainStateId: json['mainStateId'] as String?,
      name: json['name'] as String?,
      canDelete: json['canDelete'] as bool?,
      tag: json['tag'] as List<dynamic>?,
      key: json['key'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      id: json['id'] as int?,
      label:
          (json['label'] as List<dynamic>?)?.map((e) => e as String).toList(),
      userGroups: (json['userGroups'] as List<dynamic>?)
          ?.map((e) => WorkSpaceUserGroups.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NextStateToJson(NextState instance) => <String, dynamic>{
      'canDisplay': instance.canDisplay,
      'description': instance.description,
      'className': instance.className,
      'isActive': instance.isActive,
      'trId': instance.trId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'isDefault': instance.isDefault,
      'isDeleted': instance.isDeleted,
      'isFinalState': instance.isFinalState,
      'mainStateId': instance.mainStateId,
      'name': instance.name,
      'canDelete': instance.canDelete,
      'tag': instance.tag,
      'key': instance.key,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'id': instance.id,
      'label': instance.label,
      'userGroups': instance.userGroups,
    };
