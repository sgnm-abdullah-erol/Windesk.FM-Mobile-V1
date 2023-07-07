import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_work_order/work_order_spareparts_model.g.dart';

@JsonSerializable()
class WorkOrderSparepartsModel extends Equatable {
  final String? code;
  final String? module;
  final String? modulecode;
  final String? productname;
  final String? amount;
  final String? unit;

  const WorkOrderSparepartsModel({
    this.code,
    this.module,
    this.modulecode,
    this.productname,
    this.amount,
    this.unit,
  });

  factory WorkOrderSparepartsModel.fromJson(Map<String, dynamic> json) => _$WorkOrderSparepartsModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderSparepartsModelToJson(this);

  // write list json fun with map
  static List<WorkOrderSparepartsModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => WorkOrderSparepartsModel.fromJson(json)).toList();
  }

  @override
  List<Object?> get props => [
        code,
        module,
        modulecode,
        productname,
        amount,
        unit,
      ];
}
