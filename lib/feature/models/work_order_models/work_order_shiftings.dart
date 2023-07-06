import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_work_order/work_order_shiftings.g.dart';

@JsonSerializable()
class WorkOrderShiftings extends Equatable {
  final String? code;
  final String? name;

  const WorkOrderShiftings({
    this.code,
    this.name,
  });

  factory WorkOrderShiftings.fromJson(Map<String, dynamic> json) => _$WorkOrderShiftingsFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderShiftingsToJson(this);

  @override
  List<Object?> get props => [
        code,
        name,
      ];
}
