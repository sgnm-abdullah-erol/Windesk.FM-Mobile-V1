// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_order_attachments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkOrderAttachments _$WorkOrderAttachmentsFromJson(Map<String, dynamic> json) => WorkOrderAttachments(
      id: json['ID'] as int?,
      name: json['NAME'] as String?,
      filename: json['FILENAME'] as String?,
      dispfilename: json['DISPFILENAME'] as String?,
      atchtype: json['ATCHTYPE'] as String?,
      filepath: json['FILEPATH'] as String?,
      idate: json['IDATE'] as String?,
    );

Map<String, dynamic> _$WorkOrderAttachmentsToJson(WorkOrderAttachments instance) => <String, dynamic>{
      'ID': instance.id,
      'NAME': instance.name,
      'FILENAME': instance.filename,
      'DISPFILENAME': instance.dispfilename,
      'ATCHTYPE': instance.atchtype,
      'FILEPATH': instance.filepath,
      'IDATE': instance.idate,
    };
