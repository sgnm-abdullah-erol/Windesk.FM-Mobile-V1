// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../check_list_value_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckListValueModel _$CheckListValueModelFromJson(Map<String, dynamic> json) =>
    CheckListValueModel(
      id: json['id'] as int?,
      component: json['component'] as List<dynamic>?,
      facilityStructure: json['facilityStructure'] as List<dynamic>?,
      system: json['system'] as List<dynamic>?,
      statusConnection: json['statusConnection'] == null
          ? null
          : CheckListStatusConnectionModel.fromJson(
              json['statusConnection'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckListValueModelToJson(
        CheckListValueModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'component': instance.component,
      'facilityStructure': instance.facilityStructure,
      'system': instance.system,
      'statusConnection': instance.statusConnection,
    };
