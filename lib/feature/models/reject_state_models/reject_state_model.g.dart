// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RejectStateModel _$RejectStateModelFromJson(Map<String, dynamic> json) =>
    RejectStateModel(
      isDefault: json['isDefault'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      name: json['name'] as String?,
      canDelete: json['canDelete'] as bool?,
      isActive: json['isActive'] as bool?,
      key: json['key'] as String?,
      id: json['id'] as int?,
      label:
          (json['label'] as List<dynamic>?)?.map((e) => e as String).toList(),
      userGroups: (json['userGroups'] as List<dynamic>?)
          ?.map((e) => UserGroupModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RejectStateModelToJson(RejectStateModel instance) =>
    <String, dynamic>{
      'isDefault': instance.isDefault,
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'canDelete': instance.canDelete,
      'isActive': instance.isActive,
      'key': instance.key,
      'id': instance.id,
      'label': instance.label,
      'userGroups': instance.userGroups,
    };
