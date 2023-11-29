// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../component_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentModel _$ComponentModelFromJson(Map<String, dynamic> json) =>
    ComponentModel(
      willBeAppliedToComponents: (json['willBeAppliedToComponents']
              as List<dynamic>?)
          ?.map((e) =>
              WillBeAppliedToComponentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComponentModelToJson(ComponentModel instance) =>
    <String, dynamic>{
      'willBeAppliedToComponents': instance.willBeAppliedToComponents,
    };
