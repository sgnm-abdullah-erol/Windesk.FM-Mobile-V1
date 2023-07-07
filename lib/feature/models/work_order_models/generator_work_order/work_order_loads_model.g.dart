// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_order_loads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkOrderLoadsModel _$WorkOrderLoadsModelFromJson(Map<String, dynamic> json) => WorkOrderLoadsModel(
      code: json['CODE'] as String?,
      user: json['USER'] as String?,
      startdate: json['STARTDATE'],
      type: json['TYPE'] as String?,
      typeName: json['TYPE_NAME'] as String?,
      timeworked: (json['TIMEWORKED'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WorkOrderLoadsModelToJson(WorkOrderLoadsModel instance) => <String, dynamic>{
      'code': instance.code,
      'user': instance.user,
      'startdate': instance.startdate,
      'type': instance.type,
      'typeName': instance.typeName,
      'timeworked': instance.timeworked,
    };
