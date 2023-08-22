// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../asset_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetListModel _$AssetListModelFromJson(Map<String, dynamic> json) =>
    AssetListModel(
      canDisplay: json['canDisplay'] as bool?,
      warrantyDurationParts: json['warrantyDurationParts'] as int?,
      installationDate: json['installationDate'] as String?,
      description: json['description'] as String?,
      className: json['className'] as String?,
      assetIdentifier: json['assetIdentifier'],
      type: json['type'] as int?,
      externalNode: json['externalNode'] as bool?,
      isActive: json['isActive'] as bool?,
      barCode: json['barCode'] as String?,
      trId: json['trId'] as String?,
      serialNo: json['serialNo'] as String?,
      tagNumber: json['tagNumber'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      warrantyStartDate: json['warrantyStartDate'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      name: json['name'] as String?,
      warrantyDurationLabor: json['warrantyDurationLabor'] as int?,
      canDelete: json['canDelete'] as bool?,
      id: json['id'] as int?,
      tag: json['tag'],
      key: json['key'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      createdBy: json['createdBy'],
      warrantyGuarantorLabor: json['warrantyGuarantorLabor'],
      warrantyGuarantorParts: json['warrantyGuarantorParts'],
      warrantyDurationUnit: json['warrantyDurationUnit'],
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => AssetImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      structure: json['structure'],
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => AssetDocumentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AssetListModelToJson(AssetListModel instance) =>
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
      'barCode': instance.barCode,
      'trId': instance.trId,
      'serialNo': instance.serialNo,
      'tagNumber': instance.tagNumber,
      'createdAt': instance.createdAt?.toIso8601String(),
      'warrantyStartDate': instance.warrantyStartDate,
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'warrantyDurationLabor': instance.warrantyDurationLabor,
      'canDelete': instance.canDelete,
      'id': instance.id,
      'tag': instance.tag,
      'structure': instance.structure,
      'key': instance.key,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdBy': instance.createdBy,
      'warrantyGuarantorLabor': instance.warrantyGuarantorLabor,
      'warrantyGuarantorParts': instance.warrantyGuarantorParts,
      'warrantyDurationUnit': instance.warrantyDurationUnit,
      'images': instance.images,
      'documents': instance.documents,

    };
