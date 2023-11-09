// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of '../work_space_created_by.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatedBy _$CreatedByFromJson(Map<String, dynamic> json) => CreatedBy(
      id: json['id'] as String?,
      label: (json['label'] as List<dynamic>?)?.map((e) => e as String).toList(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CreatedByToJson(CreatedBy instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'name': instance.name,
    };
