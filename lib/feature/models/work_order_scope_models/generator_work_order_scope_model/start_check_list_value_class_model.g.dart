// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../start_check_list_value_class_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartCheckListValueClassModel _$StartCheckListValueClassModelFromJson(
        Map<String, dynamic> json) =>
    StartCheckListValueClassModel(
      typename: json['typename'] as String?,
      id: json['id'] as int?,
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$StartCheckListValueClassModelToJson(
        StartCheckListValueClassModel instance) =>
    <String, dynamic>{
      'typename': instance.typename,
      'id': instance.id,
      'labels': instance.labels,
    };
