// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_order_resources_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkOrderResourcesModel _$WorkOrderResourcesModelFromJson(Map<String, dynamic> json) => WorkOrderResourcesModel(
      module: json['MODULE'] as String?,
      modulecode: json['MODULECODE'] as String?,
      name: json['NAME'] as String?,
      vardiya: json['VARDIYA'] as String?,
    );

Map<String, dynamic> _$WorkOrderResourcesModelToJson(WorkOrderResourcesModel instance) => <String, dynamic>{
      'MODULE': instance.module,
      'MODULECODE': instance.modulecode,
      'NAME': instance.name,
      'VARDIYA': instance.vardiya,
    };
