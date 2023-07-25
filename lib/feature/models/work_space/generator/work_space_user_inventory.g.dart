// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_space_user_inventory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkSpaceUserInventory _$WorkSpaceUserInventoryFromJson(
        Map<String, dynamic> json) =>
    WorkSpaceUserInventory(
      id: json['id'] as int?,
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      properties: json['properties'] == null
          ? null
          : WorkSpaceUserInventoryProperties.fromJson(
              json['properties'] as Map<String, dynamic>),
      materials: (json['materials'] as List<dynamic>?)
          ?.map(
              (e) => WorkSpaceUserMaterial.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkSpaceUserInventoryToJson(
        WorkSpaceUserInventory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'labels': instance.labels,
      'properties': instance.properties,
      'materials': instance.materials,
    };
