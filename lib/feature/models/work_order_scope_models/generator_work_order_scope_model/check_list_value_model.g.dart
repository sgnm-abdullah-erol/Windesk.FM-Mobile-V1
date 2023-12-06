// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../check_list_value_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckListValueModel _$CheckListValueModelFromJson(Map<String, dynamic> json) =>
    CheckListValueModel(
      id: json['id'] as int?,
      component: json['Component'] as List<dynamic>?,
      facilityStructure: json['FacilityStructure'] as List<dynamic>?,
      system: json['System'] as List<dynamic>?,
      statusConnection: json['StatusConnection'] == null
          ? null
          : CheckListStatusConnectionModel.fromJson(
              json['StatusConnection'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckListValueModelToJson(
        CheckListValueModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Component': instance.component,
      'FacilityStructure': instance.facilityStructure,
      'System': instance.system,
      'StatusConnection': instance.statusConnection,
    };
