// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../support_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportModel _$SupportModelFromJson(Map<String, dynamic> json) => SupportModel(
      id: json['id'] as int?,
      supportPlan: (json['supportPlan'] as List<dynamic>?)
          ?.map((e) => SupportPlanModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      scheduledBy: (json['scheduledBy'] as List<dynamic>?)
          ?.map((e) => SchedulebyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SupportModelToJson(SupportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'supportPlan': instance.supportPlan,
      'scheduledBy': instance.scheduledBy,
    };
