// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetImageModel _$AssetImageModelFromJson(Map<String, dynamic> json) =>
    AssetImageModel(
      canDisplay: json['canDisplay'] as bool,
      description: json['description'] as String,
      main: json['main'] as bool,
      className: json['className'] as String,
      isActive: json['isActive'] as bool,
      url: json['url'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isDeleted: json['isDeleted'] as bool,
      name: json['name'] as String,
      canDelete: json['canDelete'] as bool,
      tag: json['tag'] as List<dynamic>,
      componentKey: json['componentKey'] as String,
      key: json['key'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      id: json['id'] as int,
    );

Map<String, dynamic> _$AssetImageModelToJson(AssetImageModel instance) =>
    <String, dynamic>{
      'canDisplay': instance.canDisplay,
      'description': instance.description,
      'main': instance.main,
      'className': instance.className,
      'isActive': instance.isActive,
      'url': instance.url,
      'createdAt': instance.createdAt.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'canDelete': instance.canDelete,
      'tag': instance.tag,
      'componentKey': instance.componentKey,
      'key': instance.key,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'id': instance.id,
    };
