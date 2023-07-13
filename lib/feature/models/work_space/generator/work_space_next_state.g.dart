// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_space_next_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NextState _$NextStateFromJson(Map<String, dynamic> json) => NextState(
      canDisplay: json['canDisplay'] as bool?,
      description: json['description'] as String?,
      className: json['className'] as String?,
      isActive: json['isActive'] as bool?,
      trId: json['trId'] as String?,
      createdAt: json['createdAt'] == null ? null : DateTime.parse(json['createdAt'] as String),
      isDefault: json['isDefault'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      isFinalState: json['isFinalState'] as bool?,
      mainStateId: json['mainStateId'] as String?,
      name: json['name'] as String?,
      canDelete: json['canDelete'] as bool?,
      tag: json['tag'] as List<dynamic>?,
      key: json['key'] as String?,
      updatedAt: json['updatedAt'] == null ? null : DateTime.parse(json['updatedAt'] as String),
      id: json['id'] as int?,
      labels: (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
