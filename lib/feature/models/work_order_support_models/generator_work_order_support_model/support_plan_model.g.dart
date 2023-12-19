// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../support_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportPlanModel _$SupportPlanModelFromJson(Map<String, dynamic> json) =>
    SupportPlanModel(
      components: (json['Components'] as List<dynamic>?)
          ?.map((e) => ComponentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      facilityStructures: json['FacilityStructures'] as List<dynamic>?,
      systems: json['Systems'] as List<dynamic>?,
    );

Map<String, dynamic> _$SupportPlanModelToJson(SupportPlanModel instance) =>
    <String, dynamic>{
      'Components': instance.components,
      'FacilityStructures': instance.facilityStructures,
      'Systems': instance.systems,
    };
