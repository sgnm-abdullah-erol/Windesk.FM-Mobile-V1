// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../checklist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckListModel _$CheckListModelFromJson(Map<String, dynamic> json) =>
    CheckListModel(
      name: json['name'] as String?,
      id: json['id'] as int?,
      hasRegulations: json['hasRegulations'] as List<dynamic>?,
      includesOfCheckItems: (json['includesOfCheckItems'] as List<dynamic>?)
          ?.map((e) =>
              IncludesOfCheckItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckListModelToJson(CheckListModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'hasRegulations': instance.hasRegulations,
      'includesOfCheckItems': instance.includesOfCheckItems,
    };
