// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_space_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

State _$StateFromJson(Map<String, dynamic> json) => State(
      isDefault: json['isDefault'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      name: json['name'] as String?,
      canDelete: json['canDelete'] as bool?,
      isActive: json['isActive'] as bool?,
      key: json['key'] as String?,
      id: json['id'] as int?,
      labels: (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      nextStates: (json['nextStates'] as List<dynamic>?)?.map((e) => NextState.fromJson(e as Map<String, dynamic>)).toList(),
    );
