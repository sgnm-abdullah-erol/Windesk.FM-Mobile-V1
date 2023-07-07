import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_work_order/work_order_shiftings_model.g.dart';

@JsonSerializable()
class WorkOrderShiftingsModel extends Equatable {
  final String? code;
  final String? name;

  const WorkOrderShiftingsModel({
    this.code,
    this.name,
  });

  factory WorkOrderShiftingsModel.fromJson(Map<String, dynamic> json) => _$WorkOrderShiftingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderShiftingsModelToJson(this);

  static List<WorkOrderShiftingsModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => WorkOrderShiftingsModel.fromJson(json)).toList();
  }

  @override
  List<Object?> get props => [
        code,
        name,
      ];
}
