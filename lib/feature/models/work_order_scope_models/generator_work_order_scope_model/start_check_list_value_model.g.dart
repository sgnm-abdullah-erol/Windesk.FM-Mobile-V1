// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../start_check_list_value_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartCheckListValueModel _$StartCheckListValueModelFromJson(
        Map<String, dynamic> json) =>
    StartCheckListValueModel(
      typename: json['typename'] as String?,
      startCheckListValue: json['startCheckListValue'] == null
          ? null
          : StartCheckListValueClassModel.fromJson(
              json['startCheckListValue'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StartCheckListValueModelToJson(
        StartCheckListValueModel instance) =>
    <String, dynamic>{
      'typename': instance.typename,
      'startCheckListValue': instance.startCheckListValue,
    };
