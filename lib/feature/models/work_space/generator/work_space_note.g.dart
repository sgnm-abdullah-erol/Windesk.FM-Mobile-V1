// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_space_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkSpaceNote _$WorkSpaceNoteFromJson(Map<String, dynamic> json) =>
    WorkSpaceNote(
      id: json['id'] as int?,
      label:
          (json['label'] as List<dynamic>?)?.map((e) => e as String).toList(),
      note: json['note'] as String?,
      value: json['value'] == null
          ? null
          : WorkSpaceNoteValue.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkSpaceNoteToJson(WorkSpaceNote instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'note': instance.note,
      'value': instance.value,
    };
