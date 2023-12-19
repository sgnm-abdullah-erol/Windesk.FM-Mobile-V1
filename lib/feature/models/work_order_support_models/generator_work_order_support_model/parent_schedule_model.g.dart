// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../parent_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParentScheduleModel _$ParentScheduleModelFromJson(Map<String, dynamic> json) =>
    ParentScheduleModel(
      checkList: (json['checkList'] as List<dynamic>?)
          ?.map((e) => CheckListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ParentScheduleModelToJson(
        ParentScheduleModel instance) =>
    <String, dynamic>{
      'checkList': instance.checkList,
    };
