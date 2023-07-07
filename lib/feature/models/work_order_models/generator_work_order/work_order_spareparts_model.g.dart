// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_order_spareparts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkOrderSparepartsModel _$WorkOrderSparepartsModelFromJson(Map<String, dynamic> json) => WorkOrderSparepartsModel(
      code: json['CODE'] as String?,
      module: json['MODULE'] as String?,
      modulecode: json['MODULECODE'] as String?,
      productname: json['PRODUCTNAME'] as String?,
      amount: json['AMOUNT'] as String?,
      unit: json['UNIT'] as String?,
    );

Map<String, dynamic> _$WorkOrderSparepartsModelToJson(WorkOrderSparepartsModel instance) => <String, dynamic>{
      'CODE': instance.code,
      'MODULE': instance.module,
      'MODULECODE': instance.modulecode,
      'PRODUCTNAME': instance.productname,
      'AMOUNT': instance.amount,
      'UNIT': instance.unit,
    };
