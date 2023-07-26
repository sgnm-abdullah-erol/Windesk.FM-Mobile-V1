// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_space_requested_materials_inventory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkSpaceRequestedMaterialsInventory _$WorkSpaceRequestedMaterialsFromJson(Map<String, dynamic> json) => WorkSpaceRequestedMaterialsInventory(
      id: json['id'] as int?,
      labels: (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      name: json['name'] as String?,
      measurementUnit: json['measurementUnit'] as String?,
      amount: json['amount'] as int?,
    );

Map<String, dynamic> _$WorkSpaceRequestedMaterialsToJson(WorkSpaceRequestedMaterialsInventory instance) => <String, dynamic>{
      'id': instance.id,
      'labels': instance.labels,
      'name': instance.name,
      'measurementUnit': instance.measurementUnit,
      'amount': instance.amount,
    };
