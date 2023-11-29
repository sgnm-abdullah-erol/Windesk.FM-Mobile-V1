// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../will_be_applied_to_component_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WillBeAppliedToComponentModel _$WillBeAppliedToComponentModelFromJson(
        Map<String, dynamic> json) =>
    WillBeAppliedToComponentModel(
      componentOriginal: json['componentOriginal'] == null
          ? null
          : ComponentOriginalModel.fromJson(
              json['componentOriginal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WillBeAppliedToComponentModelToJson(
        WillBeAppliedToComponentModel instance) =>
    <String, dynamic>{
      'componentOriginal': instance.componentOriginal,
    };
