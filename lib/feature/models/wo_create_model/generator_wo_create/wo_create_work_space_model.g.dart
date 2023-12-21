// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../wo_create_work_space_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WoCreateWorkSpaceModel _$WoCreateWorkSpaceModelFromJson(
        Map<String, dynamic> json) =>
    WoCreateWorkSpaceModel(
      canDisplay: json['canDisplay'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      name: json['name'] as String?,
      canDelete: json['canDelete'] as bool?,
      isActive: json['isActive'] as bool?,
      key: json['key'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) =>
              WoCreateWorkSpaceChildModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$WoCreateWorkSpaceModelToJson(
        WoCreateWorkSpaceModel instance) =>
    <String, dynamic>{
      'canDisplay': instance.canDisplay,
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'canDelete': instance.canDelete,
      'isActive': instance.isActive,
      'key': instance.key,
      'children': instance.children,
      'totalCount': instance.totalCount,
    };
