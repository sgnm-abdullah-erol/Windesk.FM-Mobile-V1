// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_space_requirement_materials_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkSpaceRequirementMaterialsList _$WorkSpaceRequirementMaterialsListFromJson(Map<String, dynamic> json) => WorkSpaceRequirementMaterialsList(
      id: json['id'] as int?,
      label: (json['label'] as List<dynamic>?)?.map((e) => e as String).toList(),
      name: json['name'] as String?,
      amount: json['amount'] as String?,
      measurementUnit: json['measurementUnit'] as String?,
      user: json['user'] as String?,
      totalAmount: json['totalAmount'],
      materialRequestedDate: json['materialRequestedDate'] == null ? null : DateTime.parse(json['materialRequestedDate'] as String),
    );

Map<String, dynamic> _$WorkSpaceRequirementMaterialsListToJson(WorkSpaceRequirementMaterialsList instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'name': instance.name,
      'amount': instance.amount,
      'measurementUnit': instance.measurementUnit,
      'user': instance.user,
      'totalAmount': instance.totalAmount,
      'materialRequestedDate': instance.materialRequestedDate?.toIso8601String(),
    };
