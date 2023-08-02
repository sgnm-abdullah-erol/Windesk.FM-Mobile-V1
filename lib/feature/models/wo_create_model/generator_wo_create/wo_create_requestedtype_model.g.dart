// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../wo_create_requestedtype_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WoCreateRequestedTypeModel _$WoCreateRequestedTypeModelFromJson(
        Map<String, dynamic> json) =>
    WoCreateRequestedTypeModel(
      owner: json['owner'] as String?,
      canDisplay: json['canDisplay'] as bool?,
      code: json['code'] as String?,
      type: json['type'] as String?,
      language: json['language'] as String?,
      isActive: json['isActive'] as bool?,
      trId: json['trId'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      parentOfIsDeleted: json['parentOfIsDeleted'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      name: json['name'] as String?,
      canDelete: json['canDelete'] as bool?,
      id: json['id'],
      key: json['key'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      children: (json['children'] as List<dynamic>?)
          ?.map((e) =>
              WoCreateRequestedTypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WoCreateRequestedTypeModelToJson(
        WoCreateRequestedTypeModel instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'canDisplay': instance.canDisplay,
      'code': instance.code,
      'type': instance.type,
      'language': instance.language,
      'isActive': instance.isActive,
      'trId': instance.trId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'parentOfIsDeleted': instance.parentOfIsDeleted,
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'canDelete': instance.canDelete,
      'id': instance.id,
      'key': instance.key,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'children': instance.children,
    };
