// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../checklist_has_regulation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckListHasRegulationModel _$CheckListHasRegulationModelFromJson(
        Map<String, dynamic> json) =>
    CheckListHasRegulationModel(
      name: json['name'] as String?,
      id: json['id'] as int?,
      description: json['description'] as String?,
      typename: json['typename'] as String?,
    );

Map<String, dynamic> _$CheckListHasRegulationModelToJson(
        CheckListHasRegulationModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'description': instance.description,
      'typename': instance.typename,
    };
