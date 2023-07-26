// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../wo_create_leaf_children_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WoCreateLeafChildrenModel _$WoCreateLeafChildrenModelFromJson(
        Map<String, dynamic> json) =>
    WoCreateLeafChildrenModel(
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      canDisplay: json['canDisplay'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      isDeleted: json['isDeleted'] as bool?,
      name: json['name'] as String?,
      canDelete: json['canDelete'] as bool?,
      tag: json['tag'] as List<dynamic>?,
      isActive: json['isActive'] as bool?,
      nodeType: json['nodeType'] as String?,
      key: json['key'] as String?,
      id: json['id'] as int?,
      leaf: json['leaf'] as bool?,
    );

Map<String, dynamic> _$WoCreateLeafChildrenModelToJson(
        WoCreateLeafChildrenModel instance) =>
    <String, dynamic>{
      'labels': instance.labels,
      'canDisplay': instance.canDisplay,
      'createdAt': instance.createdAt?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'canDelete': instance.canDelete,
      'tag': instance.tag,
      'isActive': instance.isActive,
      'nodeType': instance.nodeType,
      'key': instance.key,
      'id': instance.id,
      'leaf': instance.leaf,
    };
