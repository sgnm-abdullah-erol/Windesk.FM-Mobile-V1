// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../wo_create_component_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WoCreateComponentModel _$WoCreateComponentModelFromJson(
        Map<String, dynamic> json) =>
    WoCreateComponentModel(
      canDisplay: json['canDisplay'] as bool?,
      warrantyDurationParts: json['warrantyDurationParts'] as int?,
      installationDate: json['installationDate'] as String?,
      description: json['description'] as String?,
      className: json['className'] as String?,
      assetIdentifier: json['assetIdentifier'] as String?,
      type: json['type'] as int?,
      externalNode: json['externalNode'] as bool?,
      isActive: json['isActive'] as bool?,
      trId: json['trId'] as String?,
      serialNo: json['serialNo'] as String?,
      barCode: json['barCode'] as String?,
      tagNumber: json['tagNumber'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      warrantyStartDate: json['warrantyStartDate'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      name: json['name'] as String?,
      warrantyDurationLabor: json['warrantyDurationLabor'] as int?,
      canDelete: json['canDelete'] as bool?,
      tag: (json['tag'] as List<dynamic>?)?.map((e) => e as String).toList(),
      id: json['id'] as int?,
      key: json['key'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      structure: json['structure'],
      warrantyGuarantorLabor: json['warrantyGuarantorLabor'] as String?,
      warrantyGuarantorParts: json['warrantyGuarantorParts'] as String?,
      warrantyDurationUnit: json['warrantyDurationUnit'] as String?,
      images: json['images'] as List<dynamic>?,
    );

Map<String, dynamic> _$WoCreateComponentModelToJson(
        WoCreateComponentModel instance) =>
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
      'trId': instance.trId,
      'serialNo': instance.serialNo,
      'barCode': instance.barCode,
      'tagNumber': instance.tagNumber,
      'createdAt': instance.createdAt?.toIso8601String(),
      'warrantyStartDate': instance.warrantyStartDate,
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'warrantyDurationLabor': instance.warrantyDurationLabor,
      'canDelete': instance.canDelete,
      'tag': instance.tag,
      'id': instance.id,
      'key': instance.key,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'structure': instance.structure,
      'warrantyGuarantorLabor': instance.warrantyGuarantorLabor,
      'warrantyGuarantorParts': instance.warrantyGuarantorParts,
      'warrantyDurationUnit': instance.warrantyDurationUnit,
      'images': instance.images,
    };
