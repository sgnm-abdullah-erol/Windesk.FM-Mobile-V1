// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../component_properties_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentPropertiesModel _$ComponentPropertiesModelFromJson(
        Map<String, dynamic> json) =>
    ComponentPropertiesModel(
      canDisplay: json['canDisplay'] as bool?,
      warrantyDurationParts: json['warrantyDurationParts'] as int?,
      installationDate: json['installationDate'],
      description: json['description'] as String?,
      className: json['className'] as String?,
      assetIdentifier: json['assetIdentifier'] as String?,
      type: json['type'] as int?,
      externalNode: json['externalNode'] as bool?,
      isActive: json['isActive'] as bool?,
      parentId: json['parentId'] as String?,
      barCode: json['barCode'] as String?,
      serialNo: json['serialNo'] as String?,
      trId: json['trId'] as String?,
      tagNumber: json['tagNumber'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      warrantyStartDate: json['warrantyStartDate'],
      isDeleted: json['isDeleted'] as bool?,
      name: json['name'] as String?,
      warrantyDurationLabor: json['warrantyDurationLabor'] as int?,
      canDelete: json['canDelete'] as bool?,
      id: json['id'] as int?,
      tag: json['tag'] as List<dynamic>?,
      key: json['key'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      createdBy: json['createdBy'] as String?,
      structure: json['structure'],
      structureName: json['structureName'] as String?,
      warrantyGuarantorLabor: json['warrantyGuarantorLabor'] as String?,
      warrantyGuarantorParts: json['warrantyGuarantorParts'] as String?,
      warrantyDurationUnit: json['warrantyDurationUnit'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ComponentImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      documents: json['documents'] as List<dynamic>?,
    );

Map<String, dynamic> _$ComponentPropertiesModelToJson(
        ComponentPropertiesModel instance) =>
    <String, dynamic>{
      'canDisplay': instance.canDisplay,
      'warrantyDurationParts': instance.warrantyDurationParts,
      'installationDate': instance.installationDate,
      'description': instance.description,
      'className': instance.className,
      'assetIdentifier': instance.assetIdentifier,
      'type': instance.type,
      'externalNode': instance.externalNode,
      'isActive': instance.isActive,
      'parentId': instance.parentId,
      'barCode': instance.barCode,
      'serialNo': instance.serialNo,
      'trId': instance.trId,
      'tagNumber': instance.tagNumber,
      'createdAt': instance.createdAt?.toIso8601String(),
      'warrantyStartDate': instance.warrantyStartDate,
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'warrantyDurationLabor': instance.warrantyDurationLabor,
      'canDelete': instance.canDelete,
      'id': instance.id,
      'tag': instance.tag,
      'key': instance.key,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdBy': instance.createdBy,
      'structure': instance.structure,
      'structureName': instance.structureName,
      'warrantyGuarantorLabor': instance.warrantyGuarantorLabor,
      'warrantyGuarantorParts': instance.warrantyGuarantorParts,
      'warrantyDurationUnit': instance.warrantyDurationUnit,
      'images': instance.images,
      'documents': instance.documents,
    };
