import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_work_order/work_order_date_action_model.g.dart';

@JsonSerializable()
class WorkOrderDateActionModel extends Equatable {
  final String? resultcode;
  final bool? result;
  final String? uyari;

  const WorkOrderDateActionModel({
    this.resultcode,
    this.result,
    this.uyari,
  });

  factory WorkOrderDateActionModel.fromJson(Map<String, dynamic> json) => _$WorkOrderDateActionModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderDateActionModelToJson(this);

  @override
  List<Object?> get props => [
        resultcode,
        result,
        uyari,
      ];
}
