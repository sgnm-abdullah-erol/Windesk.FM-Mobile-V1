// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../asset_document_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetDocumentModel _$AssetDocumentModelFromJson(Map<String, dynamic> json) => AssetDocumentModel(
      canDisplay: json['canDisplay'] as bool?,
      description: json['description'] as String?,
      className: json['className'] as String?,
      type: json['type'] as String?,
      isActive: json['isActive'] as bool?,
      url: json['url'] as String?,
      createdAt: json['createdAt'] == null ? null : DateTime.parse(json['createdAt'] as String),
      isDeleted: json['isDeleted'] as bool?,
      name: json['name'] as String?,
      canDelete: json['canDelete'] as bool?,
      tag: json['tag'] as List<dynamic>?,
      componentKey: json['componentKey'] as String?,
      key: json['key'] as String?,
      updatedAt: json['updatedAt'] == null ? null : DateTime.parse(json['updatedAt'] as String),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$AssetDocumentModelToJson(AssetDocumentModel instance) => <String, dynamic>{
      'canDisplay': instance.canDisplay,
      'description': instance.description,
      'className': instance.className,
      'type': instance.type,
      'isActive': instance.isActive,
      'url': instance.url,
      'createdAt': instance.createdAt?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'canDelete': instance.canDelete,
      'tag': instance.tag,
      'componentKey': instance.componentKey,
      'key': instance.key,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'id': instance.id,
    };
