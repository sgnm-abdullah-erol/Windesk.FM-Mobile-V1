// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../wo_create_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WoCreateLocationModel _$WoCreateLocationModelFromJson(
        Map<String, dynamic> json) =>
    WoCreateLocationModel(
      canDisplay: json['canDisplay'] as bool?,
      description: json['description'] as String?,
      nodeType: json['nodeType'] as String?,
      isActive: json['isActive'] as bool?,
      createdAt: json['createdAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      createdBy: json['createdBy'] as String?,
      name: json['name'] as String?,
      realm: json['realm'] as String?,
      canDelete: json['canDelete'] as bool?,
      tag: (json['tag'] as List<dynamic>?)?.map((e) => e as String).toList(),
      key: json['key'] as String?,
      updatedAt: json['updatedAt'] as String?,
      id: json['id'] as int?,
      leaf: json['leaf'] as bool?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) =>
              WoCreateLocationChildrenModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WoCreateLocationModelToJson(
        WoCreateLocationModel instance) =>
    <String, dynamic>{
      'canDisplay': instance.canDisplay,
      'description': instance.description,
      'nodeType': instance.nodeType,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt,
      'isDeleted': instance.isDeleted,
      'createdBy': instance.createdBy,
      'name': instance.name,
      'realm': instance.realm,
      'canDelete': instance.canDelete,
      'tag': instance.tag,
      'key': instance.key,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
      'leaf': instance.leaf,
      'children': instance.children,
    };
