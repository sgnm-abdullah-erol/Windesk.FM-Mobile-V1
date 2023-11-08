// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_location_structure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainLocationStructure _$MainLocationStructureFromJson(
        Map<String, dynamic> json) =>
    MainLocationStructure(
      canDisplay: json['canDisplay'] as bool?,
      description: json['description'] as String?,
      nodeType: json['nodeType'] as String?,
      isActive: json['isActive'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      isDeleted: json['isDeleted'] as bool?,
      createdBy: json['createdBy'] as String?,
      name: json['name'] as String?,
      realm: json['realm'] as String?,
      canDelete: json['canDelete'] as bool?,
      tag: json['tag'] as List<dynamic>?,
      key: json['key'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      id: json['id'] as int?,
      leaf: json['leaf'] as bool?,
      children: (json['children'] as List<dynamic>?)
          ?.map(
              (e) => ChildLocationStructure.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MainLocationStructureToJson(
        MainLocationStructure instance) =>
    <String, dynamic>{
      'canDisplay': instance.canDisplay,
      'description': instance.description,
      'nodeType': instance.nodeType,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'createdBy': instance.createdBy,
      'name': instance.name,
      'realm': instance.realm,
      'canDelete': instance.canDelete,
      'tag': instance.tag,
      'key': instance.key,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'id': instance.id,
      'leaf': instance.leaf,
      'children': instance.children,
    };
