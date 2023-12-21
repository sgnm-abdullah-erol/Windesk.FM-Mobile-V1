// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../wo_create_default_ws_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WoCreateDefaultWsUser _$WoCreateDefaultWsUserFromJson(
        Map<String, dynamic> json) =>
    WoCreateDefaultWsUser(
      owner: json['owner'] as String?,
      canDisplay: json['canDisplay'] as bool?,
      isArchived: json['isArchived'] as bool?,
      timezone: json['timezone'] as String?,
      workflows:
          (json['workflows'] as List<dynamic>?)?.map((e) => e as int).toList(),
      isActive: json['isActive'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      isDeleted: json['isDeleted'] as bool?,
      name: json['name'] as String?,
      canDelete: json['canDelete'] as bool?,
      tag: json['tag'] as List<dynamic>?,
      key: json['key'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      id: json['id'] as int?,
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$WoCreateDefaultWsUserToJson(
        WoCreateDefaultWsUser instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'canDisplay': instance.canDisplay,
      'isArchived': instance.isArchived,
      'timezone': instance.timezone,
      'workflows': instance.workflows,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'canDelete': instance.canDelete,
      'tag': instance.tag,
      'key': instance.key,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'id': instance.id,
      'labels': instance.labels,
    };
