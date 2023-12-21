// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../wo_create_work_space_child_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WoCreateWorkSpaceChildModel _$WoCreateWorkSpaceChildModelFromJson(
        Map<String, dynamic> json) =>
    WoCreateWorkSpaceChildModel(
      canDisplay: json['canDisplay'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      childDefault: json['childDefault'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      className: json['className'] as String?,
      canDelete: json['canDelete'] as bool?,
      tag: json['tag'] as List<dynamic>?,
      isActive: json['isActive'] as bool?,
      key: json['key'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      id: json['id'] as int?,
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$WoCreateWorkSpaceChildModelToJson(
        WoCreateWorkSpaceChildModel instance) =>
    <String, dynamic>{
      'canDisplay': instance.canDisplay,
      'createdAt': instance.createdAt?.toIso8601String(),
      'childDefault': instance.childDefault,
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'description': instance.description,
      'className': instance.className,
      'canDelete': instance.canDelete,
      'tag': instance.tag,
      'isActive': instance.isActive,
      'key': instance.key,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'id': instance.id,
      'labels': instance.labels,
    };
