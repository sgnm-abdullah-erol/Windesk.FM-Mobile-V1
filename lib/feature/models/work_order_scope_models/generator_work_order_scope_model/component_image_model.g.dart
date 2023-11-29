// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../component_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentImageModel _$ComponentImageModelFromJson(Map<String, dynamic> json) =>
    ComponentImageModel(
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      canDisplay: json['canDisplay'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      name: json['name'] as String?,
      main: json['main'] as bool?,
      className: json['className'] as String?,
      canDelete: json['canDelete'] as bool?,
      isActive: json['isActive'] as bool?,
      componentKey: json['componentKey'] as String?,
      url: json['url'] as String?,
      key: json['key'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$ComponentImageModelToJson(
        ComponentImageModel instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt?.toIso8601String(),
      'canDisplay': instance.canDisplay,
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'main': instance.main,
      'className': instance.className,
      'canDelete': instance.canDelete,
      'isActive': instance.isActive,
      'componentKey': instance.componentKey,
      'url': instance.url,
      'key': instance.key,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'id': instance.id,
    };
