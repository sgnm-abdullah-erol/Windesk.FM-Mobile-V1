// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../check_list_edge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckListEdgeModel _$CheckListEdgeModelFromJson(Map<String, dynamic> json) =>
    CheckListEdgeModel(
      node: json['node'] == null
          ? null
          : CheckListNodeModel.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckListEdgeModelToJson(CheckListEdgeModel instance) =>
    <String, dynamic>{
      'node': instance.node,
    };
