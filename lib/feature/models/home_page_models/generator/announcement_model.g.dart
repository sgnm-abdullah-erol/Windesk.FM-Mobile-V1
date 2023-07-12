// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../announcement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementModel _$AnnouncementModelFromJson(Map<String, dynamic> json) =>
    AnnouncementModel(
      name: json['NAME'] as String?,
      announcement: json['ANNOUNCEMENT'] as String?,
    );

Map<String, dynamic> _$AnnouncementModelToJson(AnnouncementModel instance) =>
    <String, dynamic>{
      'NAME': instance.name,
      'ANNOUNCEMENT': instance.announcement,
    };
