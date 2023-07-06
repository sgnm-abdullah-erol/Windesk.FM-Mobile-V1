// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_order_loads.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkOrderLoads _$WorkOrderLoadsFromJson(Map<String, dynamic> json) => WorkOrderLoads(
      code: json['CODE'] as String?,
      user: json['USER'] as String?,
      startdate: json['STARTDATE'],
      type: json['TYPE'] as String?,
      typeName: json['TYPE_NAME'] as String?,
      timeworked: (json['TIMEWORKED'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WorkOrderLoadsToJson(WorkOrderLoads instance) => <String, dynamic>{
      'CODE': instance.code,
      'USER': instance.user,
      'STARTDATE': instance.startdate,
      'TYPE': instance.type,
      'TYPE_NAME': instance.typeName,
      'TIMEWORKED': instance.timeworked,
    };
