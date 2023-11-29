// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../scheduleby_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchedulebyModel _$SchedulebyModelFromJson(Map<String, dynamic> json) =>
    SchedulebyModel(
      parentSchedule: (json['parentSchedule'] as List<dynamic>?)
          ?.map((e) => ParentScheduleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SchedulebyModelToJson(SchedulebyModel instance) =>
    <String, dynamic>{
      'parentSchedule': instance.parentSchedule,
    };
