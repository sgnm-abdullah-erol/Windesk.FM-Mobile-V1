// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../wo_create_requestedby_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WoCreateRequestedByModel _$WoCreateRequestedByModelFromJson(
        Map<String, dynamic> json) =>
    WoCreateRequestedByModel(
      id: json['id'] as String?,
      createdTimestamp: json['createdTimestamp'] as int?,
      username: json['username'] as String?,
      enabled: json['enabled'] as bool?,
      totp: json['totp'] as bool?,
      emailVerified: json['emailVerified'] as bool?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      disableableCredentialTypes: json['disableableCredentialTypes'],
      requiredActions: (json['requiredActions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      notBefore: json['notBefore'] as int?,
      access: json['access'],
      attributes: json['attributes'],
    );

Map<String, dynamic> _$WoCreateRequestedByModelToJson(
        WoCreateRequestedByModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdTimestamp': instance.createdTimestamp,
      'username': instance.username,
      'enabled': instance.enabled,
      'totp': instance.totp,
      'emailVerified': instance.emailVerified,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'disableableCredentialTypes': instance.disableableCredentialTypes,
      'requiredActions': instance.requiredActions,
      'notBefore': instance.notBefore,
      'access': instance.access,
      'attributes': instance.attributes,
    };
