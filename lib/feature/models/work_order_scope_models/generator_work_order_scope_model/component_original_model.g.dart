// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../component_original_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentOriginalModel _$ComponentOriginalModelFromJson(
        Map<String, dynamic> json) =>
    ComponentOriginalModel(
      identity: json['identity'] == null
          ? null
          : ComponentIdentityModel.fromJson(
              json['identity'] as Map<String, dynamic>),
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      properties: json['properties'] == null
          ? null
          : ComponentPropertiesModel.fromJson(
              json['properties'] as Map<String, dynamic>),
      elementId: json['elementId'] as String?,
    );

Map<String, dynamic> _$ComponentOriginalModelToJson(
        ComponentOriginalModel instance) =>
    <String, dynamic>{
      'identity': instance.identity,
      'labels': instance.labels,
      'properties': instance.properties,
      'elementId': instance.elementId,
    };
