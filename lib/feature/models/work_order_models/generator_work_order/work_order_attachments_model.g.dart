// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_order_attachments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkOrderAttachmentsModel _$WorkOrderAttachmentsModelFromJson(Map<String, dynamic> json) => WorkOrderAttachmentsModel(
      id: json['ID'] as int?,
      name: json['NAME'] as String?,
      filename: json['FILENAME'] as String?,
      dispfilename: json['DISPFILENAME'] as String?,
      atchtype: json['ATCHTYPE'] as String?,
      filepath: json['FILEPATH'] as String?,
      idate: json['IDATE'] as String?,
    );

Map<String, dynamic> _$WorkOrderAttachmentsModelToJson(WorkOrderAttachmentsModel instance) => <String, dynamic>{
      'ID': instance.id,
      'NAME': instance.name,
      'FILENAME': instance.filename,
      'DISPFILENAME': instance.dispfilename,
      'ATCHTYPE': instance.atchtype,
      'FILEPATH': instance.filepath,
      'IDATE': instance.idate,
    };
