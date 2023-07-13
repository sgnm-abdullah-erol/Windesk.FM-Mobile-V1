// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_space.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Workspace _$WorkspaceFromJson(Map<String, dynamic> json) => Workspace(
      owner: json['owner'] as String?,
      createdAt: json['createdAt'] == null ? null : DateTime.parse(json['createdAt'] as String),
      canDisplay: json['canDisplay'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      isArchived: json['isArchived'] as bool?,
      name: json['name'] as String?,
      canDelete: json['canDelete'] as bool?,
      tag: json['tag'] as List<dynamic>?,
      workflows: (json['workflows'] as List<dynamic>?)?.map((e) => e as int).toList(),
      isActive: json['isActive'] as bool?,
      key: json['key'] as String?,
      updatedAt: json['updatedAt'] == null ? null : DateTime.parse(json['updatedAt'] as String),
      id: json['id'] as int?,
      labels: (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
