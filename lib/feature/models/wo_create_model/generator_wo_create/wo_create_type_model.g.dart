// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../wo_create_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WoCreateTypeModel _$WoCreateTypeModelFromJson(Map<String, dynamic> json) =>
    WoCreateTypeModel(
      owner: json['owner'] as String?,
      canDisplay: json['canDisplay'] as bool?,
      code: json['code'] as String?,
      language: json['language'] as String?,
      type: json['type'] as String?,
      isActive: json['isActive'] as bool?,
      trId: json['trId'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      isDeleted: json['isDeleted'] as bool?,
      name: json['name'] as String?,
      canDelete: json['canDelete'] as bool?,
      key: json['key'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      id: json['id'] as int?,
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$WoCreateTypeModelToJson(WoCreateTypeModel instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'canDisplay': instance.canDisplay,
      'code': instance.code,
      'language': instance.language,
      'type': instance.type,
      'isActive': instance.isActive,
      'trId': instance.trId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'canDelete': instance.canDelete,
      'key': instance.key,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'id': instance.id,
      'labels': instance.labels,
    };
