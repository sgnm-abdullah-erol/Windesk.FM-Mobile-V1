// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_space_spareparts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkSpaceSpareparts _$WorkSpaceSparepartsFromJson(Map<String, dynamic> json) => WorkSpaceSpareparts(
      id: json['id'] as String?,
      label: (json['label'] as List<dynamic>?)?.map((e) => e as String).toList(),
      name: json['name'] as String?,
      amount: json['amount'],
      measurementUnit: json['measurementUnit'] as String?,
      totalAmount: json['totalAmount'],
      materialUsedDate: json['materialUsedDate'] as String?,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$WorkSpaceSparepartsToJson(WorkSpaceSpareparts instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'name': instance.name,
      'amount': instance.amount,
      'measurementUnit': instance.measurementUnit,
      'totalAmount': instance.totalAmount,
      'materialUsedDate': instance.materialUsedDate,
      'user': instance.user,
    };
