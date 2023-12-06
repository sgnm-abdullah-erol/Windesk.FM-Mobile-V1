// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../check_list_maintanence_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckListMaintanenceModel _$CheckListMaintanenceModelFromJson(
        Map<String, dynamic> json) =>
    CheckListMaintanenceModel(
      checkListValue: (json['CheckListValue'] as List<dynamic>?)
          ?.map((e) => CheckListValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckListMaintanenceModelToJson(
        CheckListMaintanenceModel instance) =>
    <String, dynamic>{
      'CheckListValue': instance.checkListValue,
    };
