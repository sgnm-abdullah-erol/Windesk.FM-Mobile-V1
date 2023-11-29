// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../includesof_check_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IncludesOfCheckItemModel _$IncludesOfCheckItemModelFromJson(
        Map<String, dynamic> json) =>
    IncludesOfCheckItemModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      inputType: json['inputType'] as String?,
      labels: json['labels'] as List<dynamic>?,
      photoRequired: json['photoRequired'] as bool?,
      description: json['description'] as String?,
      isRequired: json['isRequired'] as bool?,
      documentRequired: json['documentRequired'] as bool?,
    );

Map<String, dynamic> _$IncludesOfCheckItemModelToJson(
        IncludesOfCheckItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'inputType': instance.inputType,
      'labels': instance.labels,
      'photoRequired': instance.photoRequired,
      'description': instance.description,
      'isRequired': instance.isRequired,
      'documentRequired': instance.documentRequired,
    };
