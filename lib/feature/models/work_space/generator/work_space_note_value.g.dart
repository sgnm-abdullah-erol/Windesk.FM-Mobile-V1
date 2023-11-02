// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_space_note_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkSpaceNoteValue _$WorkSpaceNoteValueFromJson(Map<String, dynamic> json) =>
    WorkSpaceNoteValue(
      noteDate: json['noteDate'] == null
          ? null
          : DateTime.parse(json['noteDate'] as String),
      user: json['user'] as String?,
    );

Map<String, dynamic> _$WorkSpaceNoteValueToJson(WorkSpaceNoteValue instance) =>
    <String, dynamic>{
      'noteDate': instance.noteDate?.toIso8601String(),
      'user': instance.user,
    };
