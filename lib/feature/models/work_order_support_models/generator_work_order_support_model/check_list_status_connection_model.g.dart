// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../check_list_status_connection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckListStatusConnectionModel _$CheckListStatusConnectionModelFromJson(
        Map<String, dynamic> json) =>
    CheckListStatusConnectionModel(
      edges: (json['edges'] as List<dynamic>?)
          ?.map((e) => CheckListEdgeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckListStatusConnectionModelToJson(
        CheckListStatusConnectionModel instance) =>
    <String, dynamic>{
      'edges': instance.edges,
    };
