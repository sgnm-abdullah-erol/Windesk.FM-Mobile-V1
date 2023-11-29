// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../maintanence_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaintanencePlanModel _$MaintanencePlanModelFromJson(
        Map<String, dynamic> json) =>
    MaintanencePlanModel(
      components: (json['Components'] as List<dynamic>?)
          ?.map((e) => ComponentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      facilityStructures: json['FacilityStructures'] as List<dynamic>?,
      systems: json['Systems'] as List<dynamic>?,
    );

Map<String, dynamic> _$MaintanencePlanModelToJson(
        MaintanencePlanModel instance) =>
    <String, dynamic>{
      'Components': instance.components,
      'FacilityStructures': instance.facilityStructures,
      'Systems': instance.systems,
    };
