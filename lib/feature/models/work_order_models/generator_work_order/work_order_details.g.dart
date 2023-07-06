// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_order_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkOrderDetails _$WorkOrderDetailsFromJson(Map<String, dynamic> json) => WorkOrderDetails(
      id: json['ID'] as String?,
      code: json['CODE'] as String?,
      name: json['NAME'] as String?,
      module: json['MODULE'] as String?,
      service: json['SERVICE'] as String?,
      modulecode: json['MODULECODE'],
      modulename: json['MODULENAME'],
      modulelocation: json['MODULELOCATION'] as String?,
      status: json['STATUS'] as String?,
      statusname: json['STATUSNAME'] as String?,
      responsible: json['RESPONSIBLE'],
      iuser: json['IUSER'] as String?,
      idate: json['IDATE'] as String?,
      plannedStartdate: json['PLANNED_STARTDATE'] as String?,
      plannedEnddate: json['PLANNED_ENDDATE'],
      plannedTime: json['PLANNED_TIME'],
      priority: json['PRIORITY'] as String?,
      actualStartdate: json['ACTUAL_STARTDATE'] as String?,
      actualEnddate: json['ACTUAL_ENDDATE'],
      actualTime: json['ACTUAL_TIME'],
      downtime: json['DOWNTIME'],
      permissionneed: json['PERMISSIONNEED'] as String?,
      closeneed: json['CLOSENEED'] as String?,
      worksafetyneed: json['WORKSAFETYNEED'] as String?,
      enfectionrisk: json['ENFECTIONRISK'] as String?,
      description: json['DESCRIPTION'],
    );

Map<String, dynamic> _$WorkOrderDetailsToJson(WorkOrderDetails instance) => <String, dynamic>{
      'ID': instance.id,
      'CODE': instance.code,
      'NAME': instance.name,
      'MODULE': instance.module,
      'SERVICE': instance.service,
      'MODULECODE': instance.modulecode,
      'MODULENAME': instance.modulename,
      'MODULELOCATION': instance.modulelocation,
      'STATUS': instance.status,
      'STATUSNAME': instance.statusname,
      'RESPONSIBLE': instance.responsible,
      'IUSER': instance.iuser,
      'IDATE': instance.idate,
      'PLANNED_STARTDATE': instance.plannedStartdate,
      'PLANNED_ENDDATE': instance.plannedEnddate,
      'PLANNED_TIME': instance.plannedTime,
      'PRIORITY': instance.priority,
      'ACTUAL_STARTDATE': instance.actualStartdate,
      'ACTUAL_ENDDATE': instance.actualEnddate,
      'ACTUAL_TIME': instance.actualTime,
      'DOWNTIME': instance.downtime,
      'PERMISSIONNEED': instance.permissionneed,
      'CLOSENEED': instance.closeneed,
      'WORKSAFETYNEED': instance.worksafetyneed,
      'ENFECTIONRISK': instance.enfectionrisk,
      'DESCRIPTION': instance.description,
    };
