// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../support_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportPlanModel _$SupportPlanModelFromJson(Map<String, dynamic> json) =>
    SupportPlanModel(
      components: (json['components'] as List<dynamic>?)
          ?.map((e) => ComponentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      facilityStructures: json['facilityStructures'] as List<dynamic>?,
      systems: json['systems'] as List<dynamic>?,
    );

Map<String, dynamic> _$SupportPlanModelToJson(SupportPlanModel instance) =>
    <String, dynamic>{
      'components': instance.components,
      'facilityStructures': instance.facilityStructures,
      'systems': instance.systems,
    };
