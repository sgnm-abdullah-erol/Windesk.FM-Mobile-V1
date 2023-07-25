// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_space_material_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkSpaceMaterialProperties _$WorkSpaceMaterialPropertiesFromJson(
        Map<String, dynamic> json) =>
    WorkSpaceMaterialProperties(
      referenceLabel: (json['referenceLabel'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      creatorId: json['creatorId'] as String?,
      description: json['description'] as String?,
      className: json['className'] as String?,
      type: json['type'] as int?,
      externalNode: json['externalNode'] as bool?,
      isActive: json['isActive'] as bool?,
      referenceId: json['referenceId'] as int?,
      trId: json['trId'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      isDeleted: json['isDeleted'] as bool?,
      supplier: json['supplier'] as String?,
      canDelete: json['canDelete'] as bool?,
      tag: json['tag'] as List<dynamic>?,
      key: json['key'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      canDisplay: json['canDisplay'] as bool?,
      structureName: json['structureName'] as String?,
      count: json['count'] as int?,
      setNumber: json['setNumber'] as String?,
      measurementUnit: json['measurementUnit'] as String?,
      tagNumber: json['tagNumber'] as String?,
      name: json['name'] as String?,
      partNumber: json['partNumber'] as String?,
      deletorId: json['deletorId'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$WorkSpaceMaterialPropertiesToJson(
        WorkSpaceMaterialProperties instance) =>
    <String, dynamic>{
      'referenceLabel': instance.referenceLabel,
      'creatorId': instance.creatorId,
      'description': instance.description,
      'className': instance.className,
      'type': instance.type,
      'externalNode': instance.externalNode,
      'isActive': instance.isActive,
      'referenceId': instance.referenceId,
      'trId': instance.trId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'supplier': instance.supplier,
      'canDelete': instance.canDelete,
      'tag': instance.tag,
      'key': instance.key,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'canDisplay': instance.canDisplay,
      'structureName': instance.structureName,
      'count': instance.count,
      'setNumber': instance.setNumber,
      'measurementUnit': instance.measurementUnit,
      'tagNumber': instance.tagNumber,
      'name': instance.name,
      'partNumber': instance.partNumber,
      'deletorId': instance.deletorId,
      'category': instance.category,
    };
