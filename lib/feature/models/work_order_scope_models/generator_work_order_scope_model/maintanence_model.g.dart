// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../maintanence_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaintanenceModel _$MaintanenceModelFromJson(Map<String, dynamic> json) =>
    MaintanenceModel(
      id: json['id'] as int?,
      maintenancePlan: (json['MaintenancePlan'] as List<dynamic>?)
          ?.map((e) => MaintanencePlanModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      scheduledBy: (json['ScheduledBy'] as List<dynamic>?)
          ?.map((e) => SchedulebyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MaintanenceModelToJson(MaintanenceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'MaintenancePlan': instance.maintenancePlan,
      'ScheduledBy': instance.scheduledBy,
    };
