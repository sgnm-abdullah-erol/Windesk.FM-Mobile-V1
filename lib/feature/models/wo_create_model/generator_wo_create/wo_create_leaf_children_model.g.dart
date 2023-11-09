// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../wo_create_leaf_children_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WoCreateLeafChildrenModel _$WoCreateLeafChildrenModelFromJson(
        Map<String, dynamic> json) =>
    WoCreateLeafChildrenModel(
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      roomTag:
          (json['roomTag'] as List<dynamic>?)?.map((e) => e as String).toList(),
      canDisplay: json['canDisplay'] as bool?,
      netArea: json['netArea'] as int?,
      images: json['images'] as String?,
      grossArea: json['grossArea'] as int?,
      code: json['code'] as String?,
      architecturalCode: json['architecturalCode'] as String?,
      documents: json['documents'] as String?,
      isBlocked: json['isBlocked'] as bool?,
      description: json['description'] as String?,
      nodeType: json['nodeType'] as String?,
      isActive: json['isActive'] as bool?,
      externalSystem: json['externalSystem'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      externalObject: json['externalObject'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      name: json['name'] as String?,
      externalIdentifier: json['externalIdentifier'] as String?,
      architecturalName: json['architecturalName'] as String?,
      usableHeight: json['usableHeight'] as int?,
      canDelete: json['canDelete'] as bool?,
      tag: json['tag'] as List<dynamic>?,
      key: json['key'] as String?,
      id: json['id'] as int?,
      leaf: json['leaf'] as bool?,
    );

Map<String, dynamic> _$WoCreateLeafChildrenModelToJson(
        WoCreateLeafChildrenModel instance) =>
    <String, dynamic>{
      'labels': instance.labels,
      'roomTag': instance.roomTag,
      'canDisplay': instance.canDisplay,
      'netArea': instance.netArea,
      'images': instance.images,
      'grossArea': instance.grossArea,
      'code': instance.code,
      'architecturalCode': instance.architecturalCode,
      'documents': instance.documents,
      'isBlocked': instance.isBlocked,
      'description': instance.description,
      'nodeType': instance.nodeType,
      'isActive': instance.isActive,
      'externalSystem': instance.externalSystem,
      'createdAt': instance.createdAt?.toIso8601String(),
      'externalObject': instance.externalObject,
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'externalIdentifier': instance.externalIdentifier,
      'architecturalName': instance.architecturalName,
      'usableHeight': instance.usableHeight,
      'canDelete': instance.canDelete,
      'tag': instance.tag,
      'key': instance.key,
      'id': instance.id,
      'leaf': instance.leaf,
    };
