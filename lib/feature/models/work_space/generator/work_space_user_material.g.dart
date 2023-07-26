// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_space_user_material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkSpaceUserMaterial _$WorkSpaceUserMaterialFromJson(Map<String, dynamic> json) => WorkSpaceUserMaterial(
      labels: (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      properties: json['properties'] == null ? null : WorkSpaceMaterialProperties.fromJson(json['properties'] as Map<String, dynamic>),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$WorkSpaceUserMaterialToJson(WorkSpaceUserMaterial instance) => <String, dynamic>{
      'labels': instance.labels,
      'properties': instance.properties,
      'id': instance.id,
    };
