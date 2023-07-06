// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_order_resources.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkOrderResources _$WorkOrderResourcesFromJson(Map<String, dynamic> json) => WorkOrderResources(
      module: json['MODULE'] as String?,
      modulecode: json['MODULECODE'] as String?,
      name: json['NAME'] as String?,
      vardiya: json['VARDIYA'] as String?,
    );

Map<String, dynamic> _$WorkOrderResourcesToJson(WorkOrderResources instance) => <String, dynamic>{
      'MODULE': instance.module,
      'MODULECODE': instance.modulecode,
      'NAME': instance.name,
      'VARDIYA': instance.vardiya,
    };
