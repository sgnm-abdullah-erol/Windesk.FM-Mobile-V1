import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_work_order/work_order_loads_model.g.dart';

@JsonSerializable()
class WorkOrderLoadsModel extends Equatable {
  final String? code;
  final String? user;
  final dynamic startdate;
  final String? type;
  final String? typeName;
  final double? timeworked;

  const WorkOrderLoadsModel({
    this.code,
    this.user,
    this.startdate,
    this.type,
    this.typeName,
    this.timeworked,
  });

  factory WorkOrderLoadsModel.fromJson(Map<String, dynamic> json) => _$WorkOrderLoadsModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderLoadsModelToJson(this);

  List<WorkOrderLoadsModel> fromJsonList(List<dynamic> json) {
    List<WorkOrderLoadsModel> workOrderLoads = [];

    for (var item in json) {
      workOrderLoads.add(WorkOrderLoadsModel.fromJson(item));
    }

    return workOrderLoads;
  }

  @override
  List<Object?> get props => [
        code,
        user,
        startdate,
        type,
        typeName,
        timeworked,
      ];
}
